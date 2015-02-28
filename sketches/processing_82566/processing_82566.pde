
class GameEnd{
  
  GameEnd(){ // Eidn scherm haalt de raakmis uit de variabel RaakMis en zit dit vervolgens onder elkaar in tekst wat je op de display kan zien
            // Ook is een er een klap geluid die waarbij de volume gekoppeld is aan met hoeveel je hebt gewonne.
    if (ShowEnd==false) {
      //
      ShowEnd=true;
      for (int i=0;i<RaakMis.size();i++) {
        String woord = (String)RaakMis.get(i);
        // Spelverloop += RaakMis.get(i)+"\n";
        if (woord=="mis") {
          spelVerloop += "mis\n";
        }
        else if (woord == "raak") {
          spelVerloop += "raak\n";
          volume++;
        }
      }
      volume = (volume*2)-10; 
      ApplauseSound.play();
    }

   


    //volume
  }
    void display(){
          background(bgEndImg); // stelt achtergrondkleur in
           text(spelVerloop, width/2+100, 150);
           ApplauseSound.setGain(volume);
           
        if (mousePressed && (mouseButton == LEFT)) {
        showStart = true;
         ApplauseSound.close();
          bgLoop.close(); 
        println("");
        setup();
        
      }
  }
     boolean test_r(boolean startGame){
     return startGame;
  }
      
}



