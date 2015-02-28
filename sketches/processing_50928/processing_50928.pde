
/*
This solution uses the modulo % operator to
switch between even (divisible by 2) and odd
(leaving a remainder) to decide how to alternate
the tiles on the row (the first loop) and how the
tiles alternate at the beginning of each row (the
second loop).

seems to work with all combinations of tiles across
and tiles down.

The nested if() was written shorthand to save space, but:

f = (tilesAcross % 2 == 0) ? 255 : 0;

could also be written:

  int tileSize = 50;
  size(400,350);
  noStroke();
  
  for(int tilesAcross = 0; tilesAcross < 8; tilesAcross++){
    for(int tilesDown = 0; tilesDown < 7; tilesDown++){
        if(tilesDown % 2 == 0){
            if(tilesAcross % 2 == 0){
              fill(#ffffff);
            }else{
              fill(#ff0000);
            }
        } else {
            if(tilesAcross % 2 == 0){
              fill(#ff0000);
            }else{
              fill(#ffffff);
            }
        }
      rect(tileSize*tilesAcross,tileSize*tilesDown,tileSize,tileSize);
    }
  }

*/

int tileSize = 50;
int f = #ff0000;
size(400,350);
noStroke();

for(int tilesAcross = 0; tilesAcross < 8; tilesAcross++){
  for(int tilesDown = 0; tilesDown < 7; tilesDown++){
      if(tilesDown % 2 == 0){
         f = (tilesAcross % 2 == 0) ? #ffffff : #ff0000;
      } else {
         f = (tilesAcross % 2 == 0) ? #ff0000 : #ffffff;
      }
    fill(f);
    rect(tileSize*tilesAcross,tileSize*tilesDown,tileSize,tileSize); 
  }
}

