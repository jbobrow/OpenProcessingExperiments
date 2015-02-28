




// camera stuff 


// Kamerasteuerung: 
float Winkel = 0.0; // Winkel bei Kreis  
float Hoehe = 1200;    // Höhe der Kamera über der Szene 
int HoeheAdd = 3;   // wird bei Spirale zu der Höhe der Kamera addiert
float Radius = 300.0;  // Anfangsradius des Kreises 
int CheckCamera_Art = 0; // Art des Kameraverhaltens 

// Kamerasteuerung bei Pfad (Art des Kameraverhaltens = 3)
boolean GehtAufEinemPfad = true; 
float PfadWert = 0.0;
float PfadWertMaximal = 100.0;

// ==========================================================

void CheckCamera () {
  // steuert die Kamera je nach der Art der Kamera
  switch (CheckCamera_Art) {
  case 0:
    // im Falle von 0
    CheckCameraSinusEbene (); // best 
    break; 
  case 1:
    // im Falle von 1
    CheckCameraSinusSpirale (); 
    break;  
  case 2:
    // im Falle von 2
    CheckCameraMaus (); 
    break;      
  case 3:
    // im Falle von 3
    CheckCameraPfad (); 
    break; 
  case 4:
    // im Falle von 4
    CheckCameraPacman (); 
    break; 

  default : 
    // sonst 
    println ("Error 133"); 
    exit();
    break;
  }
} 

// ---------------------------------------------------------

void CheckCameraSinusEbene () {
  // Kreis ist in der Ebene der Höhe "Hoehe"
  // println("Cam CheckCameraSinusEbene");
  camera (
  Radius*sin (radians(Winkel)) + x, y-210, Radius* cos (radians(Winkel)) + z, 
  x, y, z, 
  0.0, 1.0, 0.0);
}

void CheckCameraSinusSpirale () {
  // Kreis mit sich ändernder Höhe = Spirale
  camera (
  Radius*sin (radians(Winkel)) + x, Hoehe, Radius* cos (radians(Winkel)) + z, 
  x, y, z, 
  0.0, 1.0, 0.0);   

  // Wenn Höhe zu groß oder zu klein, wird der Wert, der hinzuaddiert wird, 
  // von positiv zu negativ (oder umgekehrt). Dadurch bleibt Höhe im guten 
  // Bereich. 
  if (Hoehe>=y+200) {
    HoeheAdd = abs(HoeheAdd) * -1;
  }
  if (Hoehe<=y-200) { 
    HoeheAdd = abs(HoeheAdd) ;
  }
  // Höhe verändern 
  Hoehe = Hoehe + HoeheAdd;
}

void CheckCameraMaus () {
  // Maus 
  // Der Befehl map ändert die Variable gemäß zweier Wertebereiche. Siehe Hilfe. 
  float Winkel=0.0; 
  // print (mouseX); 
  Winkel = map(mouseX, 0, width, 0, 360);
  // println ("->" + Winkel); 
  Hoehe = map(mouseY, 0, height, y-200, y+200);
  camera (
  Radius*sin(radians(Winkel)) + x, Hoehe, Radius*cos(radians(Winkel)) + z, 
  x, y, z, 
  0.0, 1.0, 0.0
    );
}

void CheckCameraPfad () {
  // Pfad 
  int x1 = 15;
  int y1 = 10;
  int z1 = 40;
  // lerp bestimmt die Flugbahn von Parameter 1 zu Parameter 2; 
  // Parameter 3 gibt dabei an, wie weit der Flug schon ist. 
  float x2 = lerp(x1, 500-10, PfadWert/100.0) ;
  float y2 = lerp(y1, 500-40, PfadWert/100.0);
  float z2 = lerp(z1, -500+10, PfadWert/100.0);

  println(PfadWert);

  // Ziel erreicht, Flug stoppen? 
  if (PfadWert>PfadWertMaximal) { 
    GehtAufEinemPfad=true;
    PfadWert=-40.0;
  }

  camera (
  x2, y2, z2, 
  x, y, z, 
  0.0, 1.0, 0.0);
}

void CheckCameraPacman () {
  camera (
  x-100, y-60, z+200, 
  x, y, z, 
  0.0, 1.0, 0.0);
}

// =====================================================================


