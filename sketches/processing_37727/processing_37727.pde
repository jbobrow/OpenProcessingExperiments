
size (300, 300);
colorMode(RGB);
background(100, random(300), random(30)); //contrasting backrounds with the modulating dart board

for (int x=0; x <width/50;x++) { //to keep the changing x co-ordinate
  for (int y=0; y<height/50; y++) { //to keep the changing y co-ordinate
    for (int size=50; size>=10;size-=10) { //to keep the changing concentric spirals
      for (int numb=7; numb>=3;numb-=3) { //to keep number of lines from the orignating point limited to 2

        strokeWeight(2);
        fill(random(30), random(100), 100); 
        stroke(16, 163, 175);
        arc(25+(x*50), 25+(y*50), size, size, radians(random(-360)), radians (random(270)));//changing geometries of the concentric arc
        stroke(255, 255, 255, 80);
        strokeWeight(0.5);
        line (25+(x*50), 25+(y*50), numb+100, numb+100);//anchorage to every dart from the similar origin
      }
    }
  }
}


