
void setup() {
  size(520,250);/*makes the canvas 520 by 250. I experimented with other sizes and picked this one specifically so that the caterpillar's head will be the same distance from the side of the canvas as the tip of his tail.*/
  background(227,206,128);/*the background is a light yellow that I picked. I learned processing has a color selector in "tools" which is pretty neat.*/
  stroke(26,57,11);// from now on, lines will be a really dark green
  fill(random(30,60),random(90,180),random(30,70));/*I made the caterpillar's color random so it can change each random value has a different range, so each caterpillar is different but always a kind of green. Try running the program a couple times and feeding several hungry caterpillars.*/
  ellipse(485,height/2,40,40);//this is the tip of the tail
  fill(random(30,60),random(90,180),random(30,70));/*This next body segment will be a different green from the last because I told it to re-randomize the colors.*/
  ellipse(445,height/2,60,60);//Also, this body segment overlaps the last one
  fill(random(30,60),random(90,180),random(30,70));
  ellipse(395,height/2,80,80);/*Here, on the third segment, I decided the caterpillar will have seven segments, including his head. I chose seven because it is prime and I like prime numbers.*/
  fill(random(30,60),random(90,180),random(30,70));
  ellipse(335,height/2,100,100);
  fill(random(30,60),random(90,180),random(30,70));
  ellipse(265,height/2,120,120);
  fill(random(30,60),random(90,180),random(30,70));
  ellipse(185,height/2,140,140);
  fill(random(30,60),random(90,180),random(30,70));
  ellipse(95,height/2,160,160); //This last ellipse here is the caterpillar's head.
  //This next part is for the caterpillar's nose.
  fill(random(60,80),random(90,180),random(30,70));/*Colors for the nose will be the same sort of colors as the rest of him but it will be a different random color with slightly different parameters for the red value.*/
  ellipse(95,height/2-10,20,10);//The nose itself is pretty small
  //This next part is for the caterpillar's eyes
  stroke(21,109,162);//picked a dark blue color for the eyes' outline
  fill(133,191,227);/*lighter blue fill for irises/sclerae. Caterpillars don't actually have those things in real life.*/
  ellipse(115,(height/2)-40,20,20);//right eye
  ellipse(75,(height/2)-40,20,20);//left eye
  //I decided the eyes were creepy just being blue so I made pupils
  stroke(0);//black for pupils
  fill(0);//also black for filling in the pupils
  ellipse(115,(height/2)-40,5,5);//right pupil
  ellipse(75,(height/2)-40,5,5);//left pupil
  //Now he needs a mouth so he can eat, so the code from here is for that
  stroke(126,52,27);//red for mouth outline
  fill(240,109,109);//fleshy pink for inside mouth
  ellipse(95,(height/2)+30,80,60);//he is very hungry so his mouth is pretty big
  print("This caterpillar is very hungry!");//Introducing the caterpillar to the user
  print(" Click on him to feed him a blueberry.");//Telling the user what to do
}
void draw (){
  if (mousePressed){//this meansit will activate when they click on the caterpillar
    stroke(21,64,108);//blue outline for the blueberry
    fill(83,109,206);//violet-ish filling
    ellipse(95,(height/2)+30,30,30);//this is the blueberry
  } 
}               
