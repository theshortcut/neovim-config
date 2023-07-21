import pygame

# Initialize pygame
pygame.init()

# Constants
WIDTH, HEIGHT = 800, 600
BLOCK_SIZE = 50
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)

# Create the screen
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Simple Minecraft")

# Player variables
player_x, player_y = 0, 0

# Game loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Get the keys pressed
    keys = pygame.key.get_pressed()

    # Move the player
    if keys[pygame.K_LEFT]:
        player_x -= BLOCK_SIZE
    if keys[pygame.K_RIGHT]:
        player_x += BLOCK_SIZE
    if keys[pygame.K_UP]:
        player_y -= BLOCK_SIZE
    if keys[pygame.K_DOWN]:
        player_y += BLOCK_SIZE

    # Draw the background
    screen.fill(WHITE)

    # Draw the player
    pygame.draw.rect(screen, RED, (player_x, player_y, BLOCK_SIZE, BLOCK_SIZE))

    # Draw some blocks
    pygame.draw.rect(screen, GREEN, (100, 100, BLOCK_SIZE, BLOCK_SIZE))
    pygame.draw.rect(screen, BLUE, (200, 200, BLOCK_SIZE, BLOCK_SIZE))

    # Update the display
    pygame.display.update()

# Quit the game
pygame.quit()
