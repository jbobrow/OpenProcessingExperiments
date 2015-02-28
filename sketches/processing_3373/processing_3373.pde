
void draw(){noCursor();colorMode(HSB,99);for(int x=0;x<99;x++)for(int y=0;y<99;y++)set(x,y,color(random(dist(x,y,mouseX,mouseY))+hue(get(x-pmouseX+mouseX,y-pmouseY+mouseY)),80,mousePressed?0:80));}

