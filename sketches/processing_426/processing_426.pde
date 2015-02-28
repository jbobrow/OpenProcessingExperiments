
/**
Gary George
Created 9-25-08
I started to play around with the scale function... I tried applying it to various
shapes.  I thought I should give it a try with a previous flower program (influence by 
Flowers by Kevin Middleton : http://openprocessing.org/visuals/?visualID=312).  I was
impressed with what resulted and decided to post it
 */

float a = .5;//10.0;
float s = 0.0;

void setup()
{
 size(500,500);
 noStroke();
 rectMode(CENTER);
 frameRate(8);
  background(random(180,250),random(180,250),random(120,250));
 
}

void draw()
{


 a = a + random(0.05,.3);
 s =a;// cos(a)*4;  // original scale code from example had cos()
if(s>0)  {
 translate(width/2, height/2);
 scale(s);
 fill(a,a,a*random(20,25),5);

//triangle(-50,-50,0,50,50,-50);

 translate(0,0); 
 rotate(radians(random(0,360))); //rotates so that the starting point is not always the same
  //number of petals (numPetals) can be varied 
  float numPetals = round(random(9, 21)); //gg-the original program did not round here which kept giving flowers that had petals that were slightly off-gg
  float petalLength = random(20, 100); 
 for (float rot = 0; rot < radians(360); rot += radians(360/(numPetals))) { 
    pushMatrix(); 
    rotate(rot); 
    beginShape(); 
    vertex(10,10); 
    //petal length = distance between x,y params (1st 2 and last 2) below 
    bezierVertex(10,10,55,20,10 + petalLength,10 + petalLength); 
    // to make the petals fatter, increase the 3rd param below 
    //petal length = distance between x,y params (1st 2 and last 2) below 
    bezierVertex(10 + petalLength ,10 + petalLength,20,55,10,10); 
    endShape();     
popMatrix(); 
  }


}
}



