
void setup(){
  size (500,500);
  background(0 );
}PFont font;
float slide=0;
void draw(){
  background(0 );
  slide+=1;
  for(int index=0;index <8000;index++){
/* rect(-20+(slide/2+(index%280)*5)%520,(index/40-index%14)*index%105,3,3);
  rect(-20+(slide+(index%280)*5)%520,100+(index/44-index%4)*5,3,3);
  fill(250,150,50);
 // println((100+(index/103+slide-index%70)*5)%530);
 
 float a,b;
 a=(100+(index/103+slide-index%45)*5)%530;
 b=-20+(slide+(index%25)*5)%520;
//if(a<550&&a>350) rect(-20+(slide/2+(index%25)*5)%520,(100+(index/103+slide-index%70)*5)%530,3,3);
// if(a<550&&a>320) rect(-20+(450+(index%45)*5)%520,(100+(index/103+slide-index%70)*5)%530,3,3);


  fill(250);

   rect(-20+(slide/2+(index%280)*5)%520,400+(index/40-index%14)*index%105,3,3);
   stroke(250);
//line(-20+(slide/2+(index*850)*205)%520,400+(index*150/40-index*2%14)*index*150%105
//,-20+(slide/2+(index*850)*205)%520,(index/40-index*50%14)*index%105);
   // rect(-20+(slide+(index%280)*5)%520,250+(index/44-(slide*index*80)%40)*5,3,3);
/*/
  rect(-20+(slide+(index%280)*5)%520,((index/4+index)*5*index+slide)%500,3,3);
  // rect(-80+(slide+(index%slide%480)*5)%520,20+(index/15)*5,3,3);

 // rect(-20+(slide+(index%30)*5)%520,25+(index/13)*5,3,3);
// rect(-80+(slide+(index%100)*5)%550,25+(index/20)*5,3,3);
  }
pushStyle();
font = loadFont("StarlinerBTN-48.vlw");
textFont(font, 32);
text("housegamejam",100,250);
popStyle();
}

