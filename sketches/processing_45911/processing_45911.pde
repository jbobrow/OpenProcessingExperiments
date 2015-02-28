
class Cartoon {
  PImage eyes;
  int picNumber;
  String charName;
  
  Cartoon(int _picNumber, String _charName){
    picNumber = _picNumber;
    charName = _charName;
    eyes = loadImage("eyes_" + picNumber + ".jpg");
  }
  
  void display(){
      background(0);
      imageMode(CENTER);
      image(eyes,width/2,height/2-70); 
      
      if (mousePressed == true) {
      // Will cycle through Cartoon Character Names
        text(charName, width/2, height/2+100);
      }
      //text(charName, width/2, height/2+100);
  }
}

