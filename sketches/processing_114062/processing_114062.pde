
import ddf.minim.*;

Minim minim;
AudioPlayer player1;

AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

void setup(){
  size(400,400);
  minim = new Minim(this);
  player1 = minim.loadFile("()In_And_Out.mp3");
  player2 = minim.loadFile("()MOTH_fea ENGELINE - JADE.mp3");
  player3 = minim.loadFile("()Smack My Bitch Up.mp3");
  player4 = minim.loadFile("DJ Fresh - Talkbox.mp3");


}

void draw(){
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  if(mousePressed == true) {
  if(mouseX < width/2 && mouseY < height/2){
  fill(random(255),random(255),random(255),random(200));
  rect(0,0,width/2,height/2);
  player4.pause();
  player3.pause();
  player2.pause();
  player1.play();
  

}
  else if (mouseX > width/2 && mouseY < height/2) {
  fill(random(255),random(255),random(255),random(200));
  rect(width/2,0,width/2,height/2);
  player1.pause();
  player3.pause();
  player4.pause();
  player2.play();

}
  else if (mouseX < width/2 && mouseY > height/2) {
  fill(random(255),random(255),random(255),random(200));
  rect(0,width/2,height/2,width/2);
  player1.pause();
  player2.pause();
  player4.pause();
  player3.play();

}
  else if (mouseX > width/2 && mouseY > height/2) {
  fill(random(255),random(255),random(255),random(200));
  rect(width/2,height/2,width/2,height/2);
  player1.pause();
  player2.pause();
  player3.pause();
  player4.play();

}
  }else{
  background(192);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  }
}


