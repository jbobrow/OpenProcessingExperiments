
import ddf.minim.*;

Minim minim;//I must look up what a class is for my blog
AudioPlayer player;//Audioplayer is a variable type for audio
AudioPlayer player2;

void setup(){
  size(400,400,P3D);
    minim=new Minim(this);
  player =minim.loadFile("123.mp3");
  player.play();
  player2= minim.loadFile("1234.mp3");
  player2.play();
}


  void draw(){
    background(0);
    stroke(255);
    for(int i=0;i<player.bufferSize() -1; i++)
    {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
  }
if (mouseX<width/2){
  player2.pause();
  player2.rewind();
  player.play();
}
else{
  
  player.pause();
  player.rewind();
  player2.play();
}
  }


