
void setup()
{
  size (500,500);
  background(0); 
  noStroke();

  
 
}

void draw()

{
   

background(0);
 fill(255);
 pushMatrix();
 translate(250, 250);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,490,490);
 popMatrix();
 pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,450,450);
 popMatrix();
  pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,410,410);
 popMatrix();
   pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,370,370);
 popMatrix();
    pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,330,330);
 popMatrix();
     pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,290,290);
 popMatrix();
      pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,250,250);
 popMatrix();
       pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,210,210);
 popMatrix();    
 pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,170,170);
popMatrix();
 pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,130,130);
popMatrix();
 pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,90,90);
popMatrix();
 pushMatrix();
  translate(250, 250);
  fill(0);
rotate(radians(millis())*-0.1);
rectMode(CENTER);
 rect(0,0,50,50);
popMatrix();
 pushMatrix();
  translate(250, 250);
  fill(255);
rotate(radians(millis())*0.1);
rectMode(CENTER);
 rect(0,0,10,10);
popMatrix();

}
