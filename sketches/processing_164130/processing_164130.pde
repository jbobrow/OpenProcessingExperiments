
int phase = 0;

void setup() {
  bgpic=loadImage("bg.jpg");
 cut1=loadImage("bgcut1.jpg");
  cut2=loadImage("bgcut2.jpg");
  cut3=loadImage("bgcut3.jpg");
  cut4=loadImage("bgcut4.jpg");
  fin=loadImage("fin.jpg");
 // */
  size(500,371);
  
}

void draw() {
  image(bgpic,0,0);
 
 phase++; 
 
 if (phase >= 30) {
  
   image(cut1, random(50),random(30));
   
 }
if (phase >=120){
  cut2.resize(500,165);
  image(cut2, random(250), 0);
  
}
if (phase >= 210){
  cut3.resize(random(500,100),random(371,100));
  image(cut3, 250, 160);
}

if (phase >= 300){
  cut4.resize(250,186);
  image(cut4, 0, 0);
  cut4.filter(INVERT);

}
if (phase>=330){
  cut4.resize(250,186);
  image(cut4, 250, 0);
  cut4.filter(INVERT);



}
if (phase>=360){
  cut4.resize(250,186);
   image(cut4, 0, 186);
  cut4.filter(INVERT);

}
if (phase>=370){
  cut4.resize(250,186);
  image(cut4, 250, 186);
  cut4.filter(INVERT);


}
if (phase>=400){
cut4.resize(250,186);
image(cut4, 125, 93);
  cut4.filter(INVERT);


}
if(phase>=450){
fin.resize(500,371);
image(fin, 0, 0);

}

if(phase>=500){
fin.filter(THRESHOLD, .8);
println("AT LEAST YOU TRIED");
}
if(phase>=550){

  phase == 0;

}
}


