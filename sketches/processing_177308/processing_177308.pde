
float y = 0.1;
float x = 0.1;
float z = 0.1;
void setup()
{
    size(600, 500, P3D);

}

void draw()
{
    background(0);
    stroke(255);
    fill(0);
    

    translate(mouseX, 200);
    rotateX(x);
    rotateY(y);
    rotateZ(z);
    box(50);
    x += random(-.1);
    
        
   
}


