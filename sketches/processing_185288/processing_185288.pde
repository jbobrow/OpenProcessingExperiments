
Maxim maxim;
AudioPlayer player;


void setup(); //happens at the start
{
    size(640,480);
    background(0);
    
    maxim = newMaxim(this);
    player = maxim.loadFile("ping.wav"); //or you can put a URL
    player.setLooping(false);
    player.volume(0.37);
    
    player.setFilter((float) mouseY/height*500,10); // 500 is arbitrary
}

void mouseDragged(); //whenever mouse dragged across screen
{
    float red = map(mouseX, 0, width, 0, 255);
    float blue = map(mouseY,0,height,0,255);
    float green = map(mouseX,mouseY,0,width/2,height/2);
    
    float speed = dist(pmouseX,pmouseY,mouseX,mouseY)
    float alpha = map(speed,0,20,0,5);
    
    float lineWidth = map(speed,0,10,10,1);
    lineWidth = constrain(lineWidth 0,10);
    
    fill(0,alpha);
    strokeWeight(lineWidth);
    
    stroke(10*speed,0,0);
    dist(pmouseX,pmouseY,mouseX,mouseY);
}

void draw(); //happens continuously
{
}
