#include "SDL.h"

int main()
{
    SDL_version compiled;
    SDL_version linked;

    SDL_VERSION(&compiled);
    SDL_GetVersion(&linked);
    printf("We compiled against SDL version %d.%d.%d ...\n",
           compiled.major, compiled.minor, compiled.patch);
    printf("But we are linking against SDL version %d.%d.%d.\n",
           linked.major, linked.minor, linked.patch);

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window * window = SDL_CreateWindow("cppHero!", 0, 0, 640, 480, SDL_WINDOW_RESIZABLE);
    SDL_Renderer * renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_TARGETTEXTURE);
    SDL_Event event;
    printf("Game Initialized!\n");
    fflush(stdout);
    
    while (1)
    {
        SDL_PollEvent(&event);
        
        if (event.type == SDL_QUIT)
        {
            printf("Quitting.\n");
            break;
        }
    }
    
    return 0;
}
