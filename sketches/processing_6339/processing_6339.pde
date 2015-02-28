
class DateiLeser {
  //-----------------------------------------------------------------------------
  //properties
  //-----------------------------------------------------------------------------
  File ordner;
  PImage[] bild;
  
  String[] daten;
  String ordnerName;

  //-----------------------------------------------------------------------------
  //constructor
  //-----------------------------------------------------------------------------
  DateiLeser(String ordnerName) {
    this.ordnerName = ordnerName;
    ordner = new File(ordnerName);

    boolean ds;
    String dsTest = ordner.list()[0];

    if(dsTest.equals(".DS_Store") == true) {
      daten = new String[ordner.list().length-1];
      ds = true;
    } else {
      daten = new String[ordner.list().length];
      ds = false;
    }
    
    if(daten != null || daten.length != 0) {
      bild = new PImage[daten.length];
  
      if(ds) {
        for(int i=0; i != ordner.list().length-1; i++) {
          daten[i] = ordner.list()[i+1];
          bild[i] = loadImage(ordnerName + "/" + daten[i]);
          println("loading image " + daten[i]);
        }

      } else if(!ds) {
        for(int i=0; i != ordner.list().length; i++) {
          daten[i] = ordner.list()[i];
          bild[i] = loadImage(ordnerName + "/" + daten[i]);
          println("loading image " + daten[i]);
        }
      }

    }
  }

  //-----------------------------------------------------------------------------
  //gets
  //-----------------------------------------------------------------------------
  int getDatenZahl() {
    return daten.length;

  }
  int getBildZahl() {
    return bild.length;
  }

  PImage getBild(int w) {
    return bild[w];
  }

  String getDaten(int w) {
    return daten[w];
  }

}

