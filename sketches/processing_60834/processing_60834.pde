
//HW 3 - Sarah Lesnikoski
/*     Absorb image by focusing on the center ellipse. Click to see after
       image. This yellow checker pattern, for most, will activate the negative
       white spaces revealing a reverse pattern again in yellow.
       Some still focus in on the positve after images and see a complimentary
       blue pattern.
       I should warn you on the eye strain... All I could see was light spots
       in my eyes after so many times testing this. It's ok though, I'm not blind 
       anymore. */

void setup() {
size (600, 600);
smooth();
noStroke();
}

void draw () {
  for(int i=0; i < 600; i += 35) {
    for (int j = 0; j < 600; j += 35)
    {
      if((i+j)%2==0) {
        fill(255);
      }else {
        fill(255,255,0);
      }
      rect(i, j, 50,50);
      fill(0);
      ellipse(298,298,10,10);
      
     if (mousePressed && (mouseButton == LEFT)) {
        fill(255);
        rect(0,0,600,600);
          fill(0);
          ellipse(298,298,10,10);      
     }
    }          
  }
}


//references:
//notes from class on for-loops, Reas and Fry; 61, Control 2: Repetition, and...
//snooping around openprocessing.org class projects for the 'mousePressed' line.  




