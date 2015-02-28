
size(565,400);
background(255,0,0);

float a =random(0,120);
int b = int(a);

if(b < 40){
  fill(255,255,255);
  noStroke();
  ellipse(515,50,100,100);//migiuesiromaru
} else if( b >= 40 && b <= 80){
  noStroke();
  rect(0,0,565,400);//maxtusiro
  fill(255,0,0);
  noStroke();
  ellipse(515,50,100,100);//migiueakamaru
}else{
  noStroke();
  fill(255,255,0);
  triangle(200,150,0,0,565,400);//mannnakanokireme
  noStroke();
  ellipse(515,50,100,100);//migiueliiromaru
}



for(int x=10; x<=500; x+=10){

  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(0,200,x,x);//hidarinotazyuumaru
}
  
  
  fill(0);
  triangle(100,125,170,50,400,100);//uenosankaku
  triangle(200,225,25,200,505,505);//mannakanohosonagaisankaku
  triangle(505,505,200,0,565,400);//migisitanosankaku
  triangle(15,200,0,350,65,400);//hidarisitasankaku



