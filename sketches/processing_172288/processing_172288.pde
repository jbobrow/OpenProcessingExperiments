
float counter = 0;
 

void setup ()
{
size (500,500);
background(255);
//background(205,46,79);
}
void draw ()
{
background (360,0,100);
//background(205,46,79);
translate (width/2, height/2);
colorMode (HSB, 360, 100, 100);

//fill(190);
//rect(-250,-250,500,1000);



float counter_mouse = map (mouseX,0,width,0.01,0.2);
float amplitude = map (sin(counter),-1,1,-100,100);


pushMatrix();
fill (64,-amplitude,96);
noStroke();
popMatrix();
pushMatrix();                                            //blitz
rotate(radians(20));
translate(0,-100);
pushMatrix();
rectMode(CENTER);
translate(-60,-70);
rect(0,0,100,20);
translate(10,35);
rotate(radians(45));
rect(0,0,20,100);
rotate(radians(-45));
translate(10,30);
rect(0,0,100,20);
rotate(radians(45));
translate(35,10);
rect(0,0,20,100);
rotate(radians(-45));
translate(10,30);
rect(0,0,100,20);
rotate(radians(-100));
translate(-30,15);
triangle(0,0,0,50,50,50);
popMatrix();
popMatrix();


fill(0);
rectMode(CENTER);

pushMatrix();                                   //linkes männchen
fill(121);
translate(-150,-50);
ellipse(-amplitude,0,50,50);
rect(-amplitude,20,25,25);
rect(-amplitude,75,50,100);
translate(25,50);
rect(-amplitude,0,17.5,50);
translate(-50,0);
rect(-amplitude,0,17.5,50);
translate(40,90);
rect(-amplitude,0,17,40);
translate(-32,0);
rect(-amplitude,0,17,40);
translate(15,-175);
ellipse(-amplitude,0,50,5);
popMatrix();


pushMatrix();                                  //rechtes männchen
fill(0);
translate(150,-50);
ellipse(amplitude,0,50,50);
rect(amplitude,20,25,25);
rect(amplitude,75,50,100);
translate(25,50);
rect(amplitude,0,17.5,50);
translate(-50,0);
rect(amplitude,0,17.5,50);
translate(40,90);
rect(amplitude,0,17,40);
translate(-32,0);
rect(amplitude,0,17,40);
translate(16,-155);
rect(amplitude,0,47,10);
translate(10,-15);
popMatrix();



pushMatrix();
fill(100);
translate(0,125);
rect(0,0,450,5);
popMatrix();


println (sin(counter));
counter += counter_mouse; //0.01; //Tempo


}
