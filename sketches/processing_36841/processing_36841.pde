
//Copyright Eric Mackie, September 2011
size (400, 400);
background (0, random(256), random(256));
stroke(random(256));
rectMode(CENTER);
float d = 5;
float tile_mx = ((width/2)-2*d)/15;
float tile_dx = tile_mx +d;
float tile_my = ((height/2)-2*d)/15;
float tile_dy = tile_my +d;
for (float x = d+(tile_mx/2); x<=width-tile_dx; x=x+tile_dx) {
  for (float y = d+(tile_my/2); y<=height-tile_dy; y=y+tile_dy) {
    float fcg = map(x, 0, width, 0, 256);
    float fcb = map(y, 0, height, 0, 256);
    fill(0, fcg, fcb);
    if (x <= width/2) {

      tile_mx = tile_mx - (tile_mx/250) ;
    }
    else {

      tile_mx = tile_mx + (tile_mx/250);
    }
    if (y <= height/2) {
      tile_my = tile_my - (tile_my/250) ;
    }
    else {

      tile_my = tile_my +(tile_my/250);
    }
    rect(x, y, tile_mx, tile_my);
  }
}
                
