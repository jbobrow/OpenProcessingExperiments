
int[] data ;
PImage img ; 

void setup () {
  size(800, 500) ;
  img = loadImage("aaron_bass.jpg");
  String[] stuff = loadStrings("data.txt") ;
  println(stuff) ;
  
  data = int(split(stuff[0], ',')) ;
}

void draw() {
  image(img, -50, -20) ;
  noStroke() ;
 int x=0;
 for (int i = 0 ; i < data.length; i++) {
   
       if(mouseX>x+50 && mouseX<=x+120){
       fill(255);
     }else{
       fill(70);

     }
 rect(i*40, 0, 38, data[i]) ;
 } 

}


