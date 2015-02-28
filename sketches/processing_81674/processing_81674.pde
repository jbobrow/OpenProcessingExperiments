
float angle = 0.0;
PFont font;
PImage sva;

void setup() {
    size(600,400,P3D); 
    textSize (70);
    sva = loadImage ("sva.png");
   
}


void draw() {  
    background(0);
    translate(width * .5, height*.5,0);
    rotateY(map(mouseX,0,width,-PI,PI));
    rotateX(map(mouseY,0,height,-PI,PI));
    pushMatrix();
    text("School of Visual Arts", -120, 0, 20);
    fill (random (180,200),100,150);

    translate(mouseX-100, mouseY-200);
    rotate(angle);
    fill(mouseX, mouseY,200);
    textSize(30);
    text("SVA", width/20, height/20);
    stroke(mouseX, mouseY+400, 200 );
    line(0,0, width, height);
     noStroke();  
     image (sva,80, 80);
    //ellipse(150, 120, 200,200);
    angle+= 2.1;
     popMatrix();

}





