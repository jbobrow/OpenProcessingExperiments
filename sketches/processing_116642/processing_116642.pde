
////Aufgabe 1: De Stijl

size(611, 720);


//Rahmen und Hintergrund
fill(229, 225, 206);
noStroke();
  rect(0, 0, 611, 720);

fill(240, 239, 233);
stroke(106, 92, 67);
  rect(12.642 , 11.798 , 583.358, 696.765);


///Überschrift

// Vorgaben für hellblaue Schriftelemente
fill(138, 155, 175);
noStroke();

//Buchstabe 1
translate(66.5, 57.5); //translate Befehle bauen aufeinander auf
  rect(0, 0, 52, 22);
  rect(0, 27.5, 18.333, 54.333);
  rect(26, 65.5, 51.5, 16.333);
  rect(60.833, 0, 16.667, 58.833);

//Buchstabe 2
translate(90.167, 0);
  rect(0, 0, 67.333, 22);
  rect(0, 27.5, 18.333, 54.333);
  rect(24, 65.5, 43.333, 16.333);

//Buchstabe 3
translate(101.333, 0);
  rect(0, 0, 18, 50.167);
  rect(0, 65.5, 52.334, 16.333);
  rect(57.334, 30.667, 14.333, 51.167);
  rect(24.667, 0, 47, 17.167);

//Buchstabe 3
translate(79.5, 0);
  rect(0, 0, 53, 15.875);
  rect(18, 22, 17.5, 59.833);

//Buchstabe 4
translate(59, 0);
  rect(0, 0, 16.5, 50.167);
  rect(0, 65.5, 44, 14);
  rect(51, 0, 14.5, 79.5);

//Buchstabe 5
translate(75.5, 0);
  rect(0, 0, 17, 54.667);
  rect(0, 62.167, 64.5, 17.333);
  rect(41.5, 0, 23, 23);


//Schwarze Rechtecke in den Buchstaben
translate(-405.5, 0); //Ausgangsposition zurückgesetzt
fill(0);
noStroke();

  rect(114.167, 29.917, 24, 24);
  rect(218.417, 27.5, 22, 22);
  rect(352, 27.5, 22.667, 22.667);


//Große dunkelblaue Rechtecke
translate(0, 113.5);
fill(30, 42, 57);
noStroke();

  rect(0, 0, 56.417, 262.667);
  rect(267.084, 0, 202.916, 37.333);
  rect(405.5, 152.667, 64.5, 256);
  rect(136.5, 417.334, 333.5, 60.666);
  rect(0, 272, 75.333, 108);


//Große, graue Rechtecke
fill(138, 155, 175);

  rect(60.833, 0, 101.333, 110);
  rect(64.167, 116.667, 65.333, 109.333);
  rect(169.5, 0, 90, 78.667);

  rect(174.5, 338, 99.667, 70.667);
  rect(280, 322, 119.333, 86.667);
  rect(338.25, 186, 61.083, 128);

//Kleine graue Rechtecke links unten
translate(0, 390.5);
  rect(0, 0, 121, 18.666);
  rect(0, 23.167, 121, 18.666);
  rect(0, 45.667, 121, 18.666);
  rect(0, 68.834, 121, 18.666);

//Kleine graue Rechtecke rechts oben
translate(-5.5, -390.5);
translate(397.6, 40.8);
  rect(0, 0, 15.166, 106.974);
  rect(20.084, 0, 15.166, 106.974);
  rect(43, 0, 15.166, 106.974);
  rect(63.084, 0, 15.166, 106.974);


//Bunte Rechtecke in der Mitte
translate(-391.75, -40.8);

//Gelb
fill(231, 184, 43);
  rect(185, 85.167, 67.5, 21.333);
  rect(190, 304, 66, 25.5);

//Blau
fill(49, 107, 168);
  rect(149, 171.333, 25.5, 54.667);
  rect(299, 186, 26.625, 58);

//Rot
fill(150, 10, 3);
  rect(218.75, 186, 40, 40);


//FINE
