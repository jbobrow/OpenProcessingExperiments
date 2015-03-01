
void setup(){
  size (500,500);
  background(0 );
}PFont font;
float slide=200;
void draw(){
  background(0 );
  slide+=1;
  for(int index=0;index <80;index++){
  fill(250,250,index*5);
   stroke(250,250,index*5);
println( 200+(index/1%1)*45%800+sin(index*slide/400)*index+" "+  slide   ); 
 rect(-20+(slide*2+(index)*40)%530,200+  (sin(constrain(slide, 30, 70)%300*0.04*(slide*0.03+(index%300))) * 100),10+index%10,10+index%10);
  } 
  

  
pushStyle();
font = loadFont("StarlinerBTN-48.vlw");
textFont(font, 15);
text("housegamejam",100,450);
popStyle();
}
