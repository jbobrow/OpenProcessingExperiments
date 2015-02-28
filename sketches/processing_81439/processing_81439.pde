
PImage blumen;
PImage biene;
PImage gelb;
PImage blume;
void setup(){
 size(600,600);
  smooth();
 gelb =loadImage ("gelb.png");
 blumen = loadImage ("blumen.jpg");
 biene = loadImage ("biene.png");
 blume = loadImage ("blume.png");
   frameRate(1);
}

void draw(){
 image(blumen,0,0,600,600);
  for(int i = 0; i<60;i++){
    
   pushMatrix();
    translate(width/2,height/2);
    rotate(radians(360/60*i));//????
     fill(random(255),random(255),random(255));
      rotate(radians(360/60*second()));

// bunte runde sekunden außen
    if(i%5==0){
     ellipse(0,130,10,20);
}
//bunte mittlere 
   if(i%5==0){
    ellipse(0,265,8,45);
}

//klein sekunden mitte
else{
rotate(radians(360/60*second()));
}
popMatrix();
}
for(int i = 0; i<60;i++){
 pushMatrix(); 
 translate(width/2,height/2);
  rotate(radians(360/60*i));

// pink rund außen
  if(i%5==0){
    fill(#cb658c);
     ellipse(0,190,40,90);
}
//weiße blätter
   else{
     fill(255);
       ellipse(0,95,5,37);
     }

// rot rund außen draufgesetzt

  if(i%15==0){
   fill(#871758);
    ellipse(0,190,50,99);}
popMatrix();
}

//stunde 
pushMatrix();
 noStroke();
  translate(width/2,height/2);
   rotate(radians(360/60*hour()+110));
    image(gelb,49,50);
popMatrix();




//minute käfer
pushMatrix();
 noStroke();
 translate(width/2,height/2);
  rotate(radians(360/60*minute()+230));
   image(blume,30,29);
popMatrix();


//sekundenzeiger Biene
pushMatrix();
 noStroke();
  translate(width/2,height/2);
   rotate(radians(360/60*second()));
    image(biene,76,55);
popMatrix();
}










