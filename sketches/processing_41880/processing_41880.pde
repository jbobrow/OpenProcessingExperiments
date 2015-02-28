
//Homework 10
//Copyright Kinnari Thakker 2011, Pittsburgh 15224

void setup()
{
    size(400, 400, P3D);
    smooth();
}

void draw()
{
    prepScreen();
    rotateInitial();
    Initial(width*.6, height*.6, 0);
}

void prepScreen()
{
    background(200);  
    lights();
    directionalLight(100,100,100,0,1,1);
}
    
    
void rotateInitial()
{
    //rotateX(radians(5));
    //rotateY(radians(frameCount));
    //rotateY(radians(5));
}

void Initial(float x, float y, float z)
{
    //sphere(50);
    //line(-100,0,0,100,0,0);
    //line(0,-100,0,0,100,0);
    ///line(0,0,-100,0,0,100);
    
    
    fill(225,240,65,200);
    pushMatrix(); //stem of the k
    translate(x-width*.2, y, z);
    box(width*0.1,height*0.5,-30);
    popMatrix();
    
    pushMatrix(); //lower polygon
    translate(x-width*0.15, y+height*0.05, z);
    beginShape(); 
    vertex(0,0);
    vertex(width*0.07, -height*0.06);
    vertex(width*0.25, height*0.2);
    vertex(width*.15, height*0.2);
    vertex(0,0);
    endShape();
    
    beginShape(); //upper polygon
    vertex(0,0);
    vertex(0,-height*0.1);
    vertex(width*0.23,-height*0.3);
    vertex(width*0.23,-height*0.2 );
    vertex(0,0);
    endShape();
    popMatrix();
    
    
}

