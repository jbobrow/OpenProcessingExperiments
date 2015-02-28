
void draw(){noCursor();colorMode(3,9);for(int x=0;x<99;x++)for(int y=0;y<99;)set(x,++y,lerpColor(color(noise(x/2)/20+hue(get(x-mouseX+pmouseX,y-mouseY+pmouseY)),8,8),get(x,y+mouseY-pmouseY),.5));}

