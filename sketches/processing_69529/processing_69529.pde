
void keyPressed() {
  
if (key == 'A'  || key == 'a') {
    baby1.play();
    baby1.rewind();
  }
  
  else if (key == 'S' || key == 's') {
    baby2.play();
    baby2.rewind();   
  }
   
  else if (key == 'D' || key == 'd') {
    baby3.play();
    baby3.rewind();
  }
  
  else if (key == 'F' || key == 'f') {
    baby4.play();
    baby4.rewind();
    
  }
  else if (key == 'G' || key == 'g') {
    baby5.play();
    baby5.rewind();
  }
  else if (key == 'H' || key == 'h') {
    baby6.play();
    baby6.rewind();
  }
  else if (key == 'J' || key == 'j') {
    baby7.play();
    baby7.rewind();
  }
  
  else if (key == 'K' || key == 'k') {
    baby8.play();
    baby8.rewind();
  }
  else if (key == 'L' || key == 'l') {
    baby9.play();
    baby9.rewind();
  }
  else if (key == ':' || key == ';') {
    baby10.play();
    baby10.rewind();
  }
  else if (key == 'Q' || key == 'q') {
    drum01.play();
    drum01.rewind();
  }
  else if (key == 'W' || key == 'w') {
    drum02.play();
    drum02.rewind();
  }
  else if (key == 'E' || key == 'e') {
    drum03.play();
    drum03.rewind();
  }
  else if (key == 'R' || key == 'r') {
    drum04.play();
    drum04.rewind();
  }
  else if (key == 'T' || key == 't') {
    drum05.play();
    drum05.rewind();
  }
  else if (key == 'Y' || key == 'y') {
    drum06.play();
    drum06.rewind();
  }
  else if (key == 'U' || key == 'u') {
    drum07.play();
    drum07.rewind();
  }
  else if (key == 'I' || key == 'i') {
    drum08.play();
    drum08.rewind();
  }
  else if (key == 'O' || key == 'o') {
    drum09.play();
    drum09.rewind();
  }
  else if (key == 'P' || key == 'p') {
    drum10.play();
    drum10.rewind();
  }
  else if (key == '{' || key == '[') {
    drum11.play();
    drum11.rewind();
  }
  
  else if (key == '1'){
    song.pause();
    background01.rewind();
    background01.play();
    background01.loop();
  }
  else if (key == '2'){
    background01.pause();
    song.rewind();
    song.play();
    song.loop();  
  }
    
}
 
  

