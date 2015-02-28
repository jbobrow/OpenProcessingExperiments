
 float diameter;
 
 void setup(){
   size(600,600);
   diameter = min(width, height) * 0.75; 
   //noStroke();
  noLoop();  // Run once and stop
  lastAngle = 0;
 }
 
 
 float lastAngle;
 
 
 
 void draw(){
   PFont f = createFont("Arial",30,true);
   textFont(f);
   background(150);
//   Scanner kb = new Scanner(new File("hatecrimes.txt"));
   String[] crimes = {"White","Black","American Indian","Asian","Multiple Races"};
   int[] data = {716,2876,54,137,209};
   textAlign(CENTER);
   text("HATE CRIME OCCURANCES IN 2008",width/2,40);
   int total = 0;
   for(int i = 0; i < 5; i++){
     total+=data[i];
   }
   int[] angle = new int[5];
   int total2 = 0;
   for(int i = 0; i < 5; i++){
     angle[i] = (int)(data[i]* 360/total+.5);
     total2+=angle[i];
   }
   f = createFont("Arial",15,true);
   textFont(f);
   for (int i = 0; i < angle.length; i++) {
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    arc(width/2, height/2, diameter, diameter, lastAngle, (i==angle.length-1?radians(360):lastAngle+radians(angle[i])));
    pushMatrix();
    translate(width/2,height/2);
    rotate(lastAngle + ((i==angle.length-1?radians(360):lastAngle+radians(angle[i]))-lastAngle)/2 + .04);
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    text(crimes[i] + ":" + data[i],150,0);
    popMatrix();
    lastAngle += radians(angle[i]);
  }
 }

