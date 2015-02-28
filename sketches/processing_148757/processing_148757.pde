
//build 2.5.3


/*--CHANGE LOG--*/

/**

2.5.3---sponge only absorbs liquids now
2.5.2---fixed taw bug
2.5.1---added sponge
2.5.0---altered the way plant grows, made it grow wood
2.4.9---fixed bug with burning wood
2.4.8---did a bunch of things to wood
2.4.7---added wood
2.4.6---plant dies when in contact with ice or oil
2.4.5---plant no longer gives off water -- it gives off steam instead
2.4.4---plant grows on its own -- made other changes and tweaks as well
2.4.3---plant has a chance of just absorbing water now instead of growing
2.4.2---plant has 12.5% chance of dropping water when burned
2.4.1---more bomb fixing...
2.4.0---tried to fix bomb more
2.3.9---made updates to bomb
2.3.8---made updates to dust
2.3.7---made plant light taw
2.3.6---fixed steam-clogging bug
2.3.5---worked on steam
2.3.4---fixed flaming oil bombs
2.3.3---added fuse
2.3.2---made updates to traw
2.3.1---added taw
2.3.0---fixed bomb
2.2.9---made bomb destructive
2.2.8---finished bomb
2.2.7---worked on bomb
2.2.6---began to add bomb
2.2.5---fixed fill and clear functionalty
2.2.4---ruined fill and clear functionality
2.2.3---added mReleased
2.2.2---fixed ice
2.2.1---added ice and fixed plant
2.2.0---fixed fill mode
2.1.9---added fill mode
2.1.8---added screenshot function
2.1.7---fixed fire-spawning lava in pause
2.1.6---fixed coloration of lava when paused

*/


/*--FUTURE PLANS--*/

/**

add clone

*/

//44 x 44 counting 2 wide walls

int[][] tiles = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
};
int[][] re = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
};

void reader(){
  stroke(0);
  for(int i = 0; i<tiles.length; i++){
    for(int j = 0; j<tiles[i].length; j++){
      float x = j*12-24;
      float y = i*12-24;
      
      int yval = 0;
      float r = 0;
      
      if(mode=="clear" && tiles[i][j]!=1){
        tiles[i][j]=0;
      }
      if(mode=="fill" && tiles[i][j]==0){
          if(m=="lava"){
            clickMaterial(x+2,y+2,x,y,10,i,j);
          }else if(m=="block"){
            clickMaterial(x+2,y+2,x,y,2,i,j);
          }else if(m=="metal"){
            clickMaterial(x+2,y+2,x,y,20,i,j);
          }else if(m=="fire"){
            clickMaterial(x+2,y+2,x,y,21,i,j);
          }else if(m=="water"){
            clickMaterial(x+2,y+2,x,y,30,i,j);
          }else if(m=="steam"){
            clickMaterial(x+2,y+2,x,y,32,i,j);
          }else if(m=="ice"){
            clickMaterial(x+2,y+2,x,y,33,i,j);
          }else if(m=="oil"){
            clickMaterial(x+2,y+2,x,y,40,i,j);
          }else if(m=="dust"){
            clickMaterial(x+2,y+2,x,y,42,i,j);
          }else if(m=="plant"){
            clickMaterial(x+2,y+2,x,y,50,i,j);
          }else if(m=="bomb"){
            clickMaterial(x+2,y+2,x,y,60,i,j);
          }else if(m=="taw"){
            clickMaterial(x+2,y+2,x,y,70,i,j);
          }else if(m=="fuse"){
            clickMaterial(x+2,y+2,x,y,80,i,j);
          }else if(m=="wood"){
            clickMaterial(x+2,y+2,x,y,90,i,j);
          }else if(m=="sponge"){
            clickMaterial(x+2,y+2,x,y,100,i,j);
          }
      }
      
      switch(tiles[i][j]){
        
        //0  air
        //1  outerwall
        //2  wall
        
        //10 lava
        //11 trans-lava
        
        //20 metal
        //21 fire
        //22 trans-fire
        //23 trans-trans-fire
        
        //30 water
        //31 trans-water
        //32 steam
        //33 ice
        //34 trans-ice
        
        //40 oil
        //41 trans-oil
        //42 powder
        //43 trans-powder
        
        //50 plant
        //51 trans-plant
        
        //60 bomb
        //61 trans-bomb
        
        //70 traw
        //71 no fire burn
        //72 trans-burn
        
        //80 fuse
        
        //90 wood
        //91 burning wood
        
        //100 sponge
        
        case 0:
          fill(100);
          if(m=="lava"){
            clickMaterial(mouseX,mouseY,x,y,10,i,j);
          }else if(m=="block"){
            clickMaterial(mouseX,mouseY,x,y,2,i,j);
          }else if(m=="metal"){
            clickMaterial(mouseX,mouseY,x,y,20,i,j);
          }else if(m=="fire"){
            clickMaterial(mouseX,mouseY,x,y,21,i,j);
          }else if(m=="water"){
            clickMaterial(mouseX,mouseY,x,y,30,i,j);
          }else if(m=="steam"){
            clickMaterial(mouseX,mouseY,x,y,32,i,j);
          }else if(m=="ice"){
            clickMaterial(mouseX,mouseY,x,y,33,i,j);
          }else if(m=="oil"){
            clickMaterial(mouseX,mouseY,x,y,40,i,j);
          }else if(m=="dust"){
            clickMaterial(mouseX,mouseY,x,y,42,i,j);
          }else if(m=="plant"){
            clickMaterial(mouseX,mouseY,x,y,50,i,j);
          }else if(m=="bomb"){
            clickMaterial(mouseX,mouseY,x,y,60,i,j);
          }else if(m=="taw"){
            clickMaterial(mouseX,mouseY,x,y,70,i,j);
          }else if(m=="fuse"){
            clickMaterial(mouseX,mouseY,x,y,80,i,j);
          }else if(m=="wood"){
            clickMaterial(mouseX,mouseY,x,y,90,i,j);
          }else if(m=="sponge"){
            clickMaterial(mouseX,mouseY,x,y,100,i,j);
          }
          break;
        case 1:
          fill(0);
          break;
        case 2:
          fill(0);
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 10:
          r = ceil(random(100));
          
          if(tiles[i+1][j]==0){
            yval+=30;
            
            if(r==1 && mode=="play"){
              tiles[i+1][j]=21;
            }
          }
          if(tiles[i-1][j]==0){
            yval+=30;
            
            if(r==2 && mode=="play"){
              tiles[i-1][j]=21;
            }
          }
          if(tiles[i][j+1]==0){
            yval+=30;
            
            if(r==3 && mode=="play"){
              tiles[i][j+1]=21;
            }
          }
          if(tiles[i][j-1]==0){
            yval+=30;
            
            if(r==4 && mode=="play"){
              tiles[i][j-1]=21;
            }
          }
          fill(250,150-yval,0);
          r = ceil(random(10));
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          
          if(mode=="play"){
          if(tiles[i+1][j]==0){
            tiles[i+1][j]=11;
            tiles[i][j]=0;
          }else if(tiles[i+1][j+1]==0 && r==1){
            tiles[i+1][j+1]=11;
            tiles[i][j]=0;
          }else if(tiles[i+1][j-1]==0 && r==2){
            tiles[i+1][j-1]=11;
            tiles[i][j]=0;
          }else if(tiles[i][j-1]==0 && r==2){
            tiles[i][j-1]=10;
            tiles[i][j]=0;
          }else if(tiles[i][j+1]==0 && r==1){
            tiles[i][j+1]=11;
            tiles[i][j]=0;
          }
          }
          break;
        case 11:
          fill(100);
          tiles[i][j]=10;
          if(m=="block"){
            clickMaterial(mouseX,mouseY,x,y,2,i,j);
          }else if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 20:
          fill(150);
          
          if(mode=="play"){
          r = random(50);
          if(tiles[i-1][j]==10 && r<1){
            tiles[i][j]=10;
          }else if(tiles[i][j+1]==10 && r<1){
            tiles[i][j]=10;
          }else if(tiles[i][j-1]==10 && r<1){
            tiles[i][j]=10;
          }else if(tiles[i+1][j]==10 && r<1){
            tiles[i][j]=10;
          }else if(tiles[i-1][j]==30 && r<0.5){
            tiles[i][j]=42;
          }else if(tiles[i][j+1]==30 && r<0.5){
            tiles[i][j]=42;
          }else if(tiles[i][j-1]==30 && r<0.5){
            tiles[i][j]=42;
          }else if(tiles[i+1][j]==30 && r<0.5){
            tiles[i][j]=42;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 21:
          fill(250,0,0);
          
          r = random(50);
          if(mode=="play"){
          if(r>40){
            tiles[i][j]=0;
          }else if(r>10){
            if(tiles[i-1][j]==0 && r>30){
              tiles[i-1][j]=21;
              tiles[i][j]=0;
            }else if(tiles[i-1][j-1]==0 && r>20){
              tiles[i-1][j-1]=21;
              tiles[i][j]=0;
            }else if(tiles[i-1][j+1]==0 && r>10){
              tiles[i-1][j+1]=21;
              tiles[i][j]=0;
            }
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 22:
          fill(100);
          tiles[i][j]=21;
          break;
        case 23:
          fill(100);
          tiles[i][j]=22;
          break;
        case 30:
          fill(0,100,250);
          r = ceil(random(10));
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          if(mode=="play"){
          if(tiles[i+1][j]==10){
            if(r<6){
              tiles[i][j]=0;
              tiles[i+1][j]=32;
            }else{
              tiles[i][j]=20;
            }
          }
          if(tiles[i-1][j]==10){
            if(r<6){
              tiles[i][j]=32;
              tiles[i-1][j]=0;
            }else{
              tiles[i][j]=20;
            }
          }
          if(tiles[i][j+1]==10){
            if(r<6){
              tiles[i][j]=32;
              tiles[i][j+1]=0;
            }else{
              tiles[i][j]=20;
            }
          }
          if(tiles[i][j-1]==10){
            if(r<6){
              tiles[i][j]=32;
              tiles[i][j-1]=0;
            }else{
              tiles[i][j]=20;
            }
          }
          
          if(tiles[i+1][j]==0){
            tiles[i+1][j]=31;
            tiles[i][j]=0;
          }else if(tiles[i+1][j+1]==0 && r==1){
            tiles[i+1][j+1]=31;
            tiles[i][j]=0;
          }else if(tiles[i+1][j-1]==0 && r==2){
            tiles[i+1][j-1]=31;
            tiles[i][j]=0;
          }else if(tiles[i][j-1]==0 && r==2){
            tiles[i][j-1]=30;
            tiles[i][j]=0;
          }else if(tiles[i][j+1]==0 && r==1){
            tiles[i][j+1]=31;
            tiles[i][j]=0;
          }
          }
          break;
        case 31:
          fill(100);
          tiles[i][j]=30;
          break;
        case 32:
          r = random(80);
          fill(250);
          
          if(mode=="play"){
          if(r<2 && tiles[i-1][j]==0 || r<2 && tiles[i][j-1]==0 || r<2 && tiles[i][j+1]==0 || r<2 && tiles[i+1][j]==0){
            tiles[i][j]=30;
          }
          
          if(tiles[i-1][j]==0){
            tiles[i][j]=0;
            tiles[i-1][j]=32;
          }else if(tiles[i-1][j]==10){
            tiles[i][j]=10;
            tiles[i-1][j]=32;
          }else if(tiles[i-1][j]==30){
            tiles[i][j]=30;
            tiles[i-1][j]=32;
          }else if(tiles[i-1][j]==40){
            tiles[i][j]=40;
            tiles[i-1][j]=32;
          }else if(tiles[i-1][j-1]==0 && r<40){
            tiles[i][j]=0;
            tiles[i-1][j-1]=32;
          }else if(tiles[i-1][j+1]==0 && r>40){
            tiles[i][j]=0;
            tiles[i-1][j+1]=32;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 33:
          r = random(80);
          fill(50,250,250);
          
          if(mode=="play"){
          if(tiles[i-1][j]==21 && r<20 || tiles[i-1][j]==10 && r<40){
            tiles[i][j]=31;
          }else if(tiles[i+1][j]==21 && r<20 || tiles[i+1][j]==10 && r<40){
            tiles[i][j]=30;
          }else if(tiles[i][j+1]==21 && r<20 || tiles[i][j+1]==10 && r<40){
            tiles[i][j]=30;
          }else if(tiles[i][j-1]==21 && r<20 || tiles[i][j-1]==10 && r<40){
            tiles[i][j]=31;
          }else if(tiles[i-1][j]==30 && r>78){
            tiles[i-1][j]=34;
          }else if(tiles[i+1][j]==30 && r>78){
            tiles[i+1][j]=33;
          }else if(tiles[i][j+1]==30 && r>78){
            tiles[i][j+1]=33;
          }else if(tiles[i][j-1]==30 && r>78){
            tiles[i][j-1]=34;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 34:
          fill(50,250,250);
          tiles[i][j]=33;
          break;
        case 40:
          r = ceil(random(8));
          fill(150,50,0);
          
          if(mode=="play"){
          if(tiles[i-1][j]==30){
            tiles[i-1][j]=40;
            tiles[i][j]=31;
          }else if(tiles[i][j-1]==30 && r==1){
            tiles[i][j-1]=40;
            tiles[i][j]=30;
          }else if(tiles[i][j+1]==30 && r==2){
            tiles[i][j+1]=40;
            tiles[i][j]=30;
          }else if(tiles[i+1][j]==0){
            tiles[i+1][j]=41;
            tiles[i][j]=0;
          }else if(tiles[i+1][j+1]==0 && r==1){
            tiles[i+1][j+1]=41;
            tiles[i][j]=0;
          }else if(tiles[i+1][j-1]==0 && r==2){
            tiles[i+1][j-1]=41;
            tiles[i][j]=0;
          }else if(tiles[i][j-1]==0 && r==2){
            tiles[i][j-1]=40;
            tiles[i][j]=0;
          }else if(tiles[i][j+1]==0 && r==1){
            tiles[i][j+1]=41;
            tiles[i][j]=0;
          }else if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
            tiles[i][j]=22;
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
            tiles[i][j]=22;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 41:
          fill(100);
          tiles[i][j]=40;
          break;
        case 42:
          r = ceil(random(8));
          fill(220,220,100);
          
          if(mode=="play"){
          if(tiles[i+1][j]==0 && r<4){
            tiles[i+1][j]=43;
            tiles[i][j]=0;
          }else if(tiles[i+1][j]==30 && r<4){
            tiles[i+1][j]=43;
            tiles[i][j]=30;
          }else if(tiles[i+1][j]==40 && r<4){
            tiles[i+1][j]=43;
            tiles[i][j]=40;
          }
          if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
            tiles[i][j]=22;
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
            tiles[i][j]=22;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 43:
          fill(100);
          tiles[i][j]=42;
          break;
        case 50:
          r = random(80);
          fill(50,200,10);
          
          if(mode=="play"){
          if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
            if(r<40){
              tiles[i][j]=22;
            }else if(r<45){
              tiles[i][j]=32;
            }
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
            if(r<40){
              tiles[i][j]=21;
            }else if(r<45){
              tiles[i][j]=32;
            }
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
            if(r<40){
              tiles[i][j]=21;
            }else if(r<45){
              tiles[i][j]=32;
            }
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
            if(r<40){
              tiles[i][j]=22;
            }else if(r<45){
              tiles[i][j]=32;
            }
          }else if(tiles[i-1][j]==30){
            if(r>75){
              tiles[i-1][j]=51;
            }else if(r>70){
              tiles[i-1][j]=0;
            }
          }else if(tiles[i+1][j]==30){
            if(r>75){
              tiles[i+1][j]=51;
            }else if(r>70){
              tiles[i+1][j]=0;
            }
          }else if(tiles[i][j+1]==30){
            if(r>75){
              tiles[i][j+1]=51;
            }else if(r>70){
              tiles[i][j+1]=0;
            }
          }else if(tiles[i-1][j-1]==30){
            if(r>75){
              tiles[i-1][j-1]=51;
            }else if(r>70){
              tiles[i-1][j-1]=0;
            }
          }else if(tiles[i-1][j]==33 || tiles[i+1][j]==33 || tiles[i][j-1]==33 || tiles[i][j+1]==33 || tiles[i-1][j]==40 || tiles[i+1][j]==40 || tiles[i][j-1]==40 || tiles[i][j+1]==40){
            tiles[i][j]=42;
          }else if(tiles[i-1][j]==0 && r>79.8){
            tiles[i-1][j]=50;
            if(tiles[i+1][j]==50){
              tiles[i+1][j]=90;
            }
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 51:
          fill(50,200,10);
          tiles[i][j]=50;
          break;
        case 60:
          r = random(80);
          fill(150,120,20);
          
          if(mode=="play"){
          if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
            tiles[i][j]=23;
            if(tiles[i-1][j]!=1 && tiles[i-1][j]!=60){
              tiles[i-1][j]=21;
            }
            if(tiles[i+1][j]!=1 && tiles[i+1][j]!=60){
              tiles[i+1][j]=23;
            }
            if(tiles[i][j+1]!=1 && tiles[i][j+1]!=60){
              tiles[i][j+1]=23;
            }
            if(tiles[i][j-1]!=1 && tiles[i][j-1]!=60){
              tiles[i][j-1]=21;
            }
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
            tiles[i][j]=23;
            if(tiles[i-1][j]!=1 && tiles[i-1][j]!=60){
              tiles[i-1][j]=21;
            }
            if(tiles[i+1][j]!=1 && tiles[i+1][j]!=60){
              tiles[i+1][j]=23;
            }
            if(tiles[i][j+1]!=1 && tiles[i][j+1]!=60){
              tiles[i][j+1]=23;
            }
            if(tiles[i][j-1]!=1 && tiles[i][j-1]!=60){
              tiles[i][j-1]=21;
            }
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
            tiles[i][j]=22;
            if(tiles[i-1][j]!=1 && tiles[i-1][j]!=60){
              tiles[i-1][j]=21;
            }
            if(tiles[i+1][j]!=1 && tiles[i+1][j]!=60){
              tiles[i+1][j]=23;
            }
            if(tiles[i][j+1]!=1 && tiles[i][j+1]!=60){
              tiles[i][j+1]=23;
            }
            if(tiles[i][j-1]!=1 && tiles[i][j-1]!=60){
              tiles[i][j-1]=21;
            }
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
            tiles[i][j]=22;
            if(tiles[i-1][j]!=1 && tiles[i-1][j]!=60){
              tiles[i-1][j]=21;
            }
            if(tiles[i+1][j]!=1 && tiles[i+1][j]!=60){
              tiles[i+1][j]=23;
            }
            if(tiles[i][j+1]!=1 && tiles[i][j+1]!=60){
              tiles[i][j+1]=23;
            }
            if(tiles[i][j-1]!=1 && tiles[i][j-1]!=60){
              tiles[i][j-1]=21;
            }
          }else if(tiles[i+1][j]==0){
            tiles[i][j]=0;
            tiles[i+1][j]=61;
          }else if(tiles[i+1][j]==30){
            tiles[i][j]=30;
            tiles[i+1][j]=61;
          }else if(tiles[i+1][j]==40){
            tiles[i][j]=40;
            tiles[i+1][j]=61;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 61:
          fill(100);
          tiles[i][j]=60;
          break;
        case 70:
          fill(180,50,220);
          
          if(mode=="play"){
          if(tiles[i-1][j]==21 || tiles[i-1][j]==71 || tiles[i-1][j]==50){
            tiles[i][j]=72;
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==71 || tiles[i+1][j]==50){
            tiles[i][j]=71;
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==71 || tiles[i][j+1]==50){
            tiles[i][j]=71;
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==71 || tiles[i][j-1]==50){
            tiles[i][j]=72;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 71:
          fill(100);
          tiles[i][j]=0;
          break;
        case 72:
          fill(100);
          tiles[i][j]=71;
          break;
        case 80:
          fill(250,200,200);
          
          if(mode=="play"){
          if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
            tiles[i][j]=22;
          }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
            tiles[i][j]=21;
          }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
            tiles[i][j]=22;
          }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 90:
          fill(190,100,0);
          
          if(mode=="play"){
            if(tiles[i-1][j]==21 || tiles[i-1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i-1][j+1]==21 || tiles[i+1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i-1][j-1]==21 || tiles[i+1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i+1][j]==21 || tiles[i+1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i+1][j+1]==21 || tiles[i+1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i+1][j-1]==21 || tiles[i+1][j]==10){
              tiles[i][j]=91;
            }else if(tiles[i][j+1]==21 || tiles[i][j+1]==10){
              tiles[i][j]=91;
            }else if(tiles[i][j-1]==21 || tiles[i][j-1]==10){
              tiles[i][j]=91;
            }
            
            r = random(80);
            
            if(tiles[i+1][j]==50 && r>79){
              tiles[i+1][j]=90;
            }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 91:
          fill(200,120,0);
          r = ceil(random(8));
          
          if(mode=="play"){
            if(tiles[i-1][j]==0 && r==1){
              tiles[i-1][j]=21;
            }
            if(tiles[i+1][j]==0 && r==2){
              tiles[i+1][j]=22;
            }
            if(tiles[i][j-1]==0 && r==3){
              tiles[i][j-1]=21;
            }
            if(tiles[i][j+1]==0 && r==4){
              tiles[i][j+1]=22;
            }
            
            r=random(80);
            
            if(r>79){
              tiles[i][j]=21;
            }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
        case 100:
          fill(250,250,0);
          
          r=ceil(random(20));
          
          if(mode=="play"){
            if(tiles[i-1][j]==30 && tiles[i-1][j]==40 && tiles[i-1][j]==10 && r==1){
              tiles[i-1][j]=0;
            }
            if(tiles[i+1][j]==30 && tiles[i+1][j]==40 && tiles[i+1][j]==10 && r==2){
              tiles[i+1][j]=0;
            }
            if(tiles[i][j-1]==30 && tiles[i][j-1]==40 && tiles[i][j-1]==10 && r==3){
              tiles[i][j-1]=0;
            }
            if(tiles[i][j+1]==30 && tiles[i][j+1]==40 && tiles[i][j+1]==10 && r==4){
              tiles[i][j+1]=0;
            }
          }
          
          if(m=="erase"){
            clickMaterial(mouseX,mouseY,x,y,0,i,j);
          }
          break;
      }
      if(mouseX>x && mouseY>y && mouseX<x+13 && mouseY<y+13){
        strokeWeight(1.5);
      }else{
        strokeWeight(1);
      }
      rect(x,y,12,12);
    }
  }
}

void clickMaterial(float x1,float y1,float x2,float y2,int numChange,int c, int r){
  if(x1>x2 && mousePressed && y1>y2 && y1<y2+13 && x1<x2+13){
    tiles[c][r]=numChange;
  }
}

String m = "lava";
void materialButton(int x, int y, String material, color col){
  fill(50);
  stroke(0);
  strokeWeight(1);
  if(mouseX > x && mouseY > y && mouseX < x+60 && mouseY<y+20){
    fill(100);
    if(mReleased){
      m=material;
    }
  }
  
  if(m==material){
    stroke(255);
  }
  rect(x,y,60,20);
  
  textSize(18);
  fill(col);
  text(material,x+30-textWidth(material)/2,y+16);
}

String mode = "play";
void modeButton(int x, int y, String type){
  if(type=="fill" && mode=="fill"){
    mode="stop";
  }
  if(type=="clear" && mode=="clear"){
    mode="stop";
  }
  
  fill(50);
  stroke(0);
  strokeWeight(1);
  if(mouseX > x && mouseY > y && mouseX < x+60 && mouseY<y+20){
    fill(100);
    if(mousePressed){
      if(type=="play"){
        mode="play";
      }
      if(type=="stop"){
        mode="stop";
      }
      if(type=="clear"){
        mode="clear";
      }
      if(type=="fill"){
        mode="fill";
      }
    }
  }
  
  if(mode==type){
    stroke(255);
  }
  rect(x,y,60,20);
  
  textSize(18);
  fill(255);
  text(type,x+30-textWidth(type)/2,y+16);
}

void setup(){
  size(480,564);
  
  frameRate(20);
}

boolean mReleased=false;
void mouseReleased(){
  mReleased = true;
}

void keyReleased(){
  if(keyCode==32){
    saveFrame("screenshots/"+day()+minute()+second()+".jpg");
  }
}

void draw(){
  reader();
  fill(50);
  rect(0,480,480,100);
  
  
  //60 x 20
  
  //left column
  materialButton(0,480,"lava",color(255,100,0));
  materialButton(0,501,"block",color(0));
  materialButton(0,522,"metal",color(150));
  materialButton(0,543,"fire",color(250,0,0));
  
  materialButton(61,480,"water",color(0,100,250));
  materialButton(61,501,"steam",color(250));
  materialButton(61,522,"oil",color(150,50,0));
  materialButton(61,543,"dust",color(220,220,100));
  
  materialButton(122,480,"plant",color(50,200,10));
  materialButton(122,501,"ice",color(50,250,250));
  materialButton(122,522,"bomb",color(150,120,20));
  materialButton(122,543,"taw",color(180,50,220));
  
  materialButton(183,480,"fuse",color(250,200,200));
  materialButton(183,501,"wood",color(190,100,0));
  materialButton(183,522,"sponge",color(250,250,0));
  
  //right column
  materialButton(305,480,"erase",color(255));
  modeButton(305,501,"clear");
  modeButton(305,522,"play");
  modeButton(305,543,"stop");
  
  modeButton(366,480,"fill");
  
  
  
  
  
  mReleased=false;
}
