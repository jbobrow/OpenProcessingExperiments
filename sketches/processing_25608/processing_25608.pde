
void setup () {
 size (800, 800);
 background (0);
 smooth ();
}
 
 
 void draw (){
 stroke(255);

 strokeWeight(5);
 fill(87,97,97); //grey//
 rect (0,0,80,100);//rectangle top left//
 
 fill (44,203,224);//electric blue//
 rect(0,100,80,600);//rectangle midlle left//
 
fill(87,97,97); //grey//
rect (80,500,150,200);//top bottom grey,left//

rect(80,700,150,200);//bottom grey,left//

fill(241,244,213);//beige//
rect (80,100,150,400);//left beige rect//

fill(10,46,186);//hard blue//
rect(80+150,0,400,100);

fill(175,149,56);//gold//
rect(80+150,500,400,200);

fill(241,244,213);//beige//
rect(630,20,100,200);//beige right rect//

fill(10,46,186);//hard blue//
rect(630,220,100,280);//hard blue right rect//

fill(87,97,97); //grey//
rect(630,500,100,100);//top right grey rect//

fill(87,97,97); //grey//
rect(630,600,100,100);//bottom right grey rect//

fill(87,97,97); //grey//
rect(730,20,65,480);//skinny right rect//

fill(87,97,97); //grey//
rect(730,500,65,200);
  }
