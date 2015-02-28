
//data set
//by emily hundley
//data was retrieved from http://www.bls.gov/

  size(600,600);
  colorMode(HSB,360,100,100,100);
  background(278,31,56);
  
   // backround table
  fill(241,8,93,57);
  stroke(241,0,0,56); 
  ellipse(width/2,height/2,571,571); 
noFill();
  fill(278,31,56);
  stroke(278,31,56);
 rectMode(CENTER);rect(width/2,height/2,81,81);
 noFill();
   stroke(226,20,78,31);
fill(226,20,78,31);
triangle(width/2, height/2, 105, 507, 496, 507);
triangle(width/2, height/2, 105, 96, 496, 96);
noFill();


   // clock numbers

fill(279,8,4);
textSize(41);
text("12",285,56);
text("1",452,110);
text("2",533,198);
text("3",549,326);
text("5",401,538);
text("4",507,441);
text("6",285,560);
text("9",27,326);
text("7",147,538);
text("8",72,441);
text("10",59,198);
text("11",131,110);

noFill();

   //Key 
textSize(13);
fill(223,23,98);
text("Personal Care",6,515);
noFill();
fill(279,98,26);
text("Sleeping",6,530);
fill(223,58,37);
text("eating and drinking",6,545);
noFill();
fill(359,93,65);
text("Household Activities",6,560);
noFill();
fill(359,38,90);
text("housework",6,575);
noFill();
fill(223,47,70);
text("Food prep and cleanup",6,590);
noFill();
fill(359,99,62);
text("Lawn and garden care",6,15);
noFill();
fill(279,91,53);
text("Consumer purchases",6,30);
noFill();
fill(359,13,92);
text("Caring for house members",6,45);
noFill();
fill(279,25,78);
text("Leisure",6,60);
noFill();
fill(279,39,47);
text("Socilizing",6,75);
noFill();
fill(359,20,93);
text("household manegement",438,15);
noFill();
fill(279,99,94);
text("Watching Television",438,30);
noFill();
fill(320,59,62);
text("Work",438,45);
noFill();
fill(320,59,62);
text("Education",495,520);
noFill();


   //information
strokeWeight(1.7);
//personal care activities light purple
stroke(223,23,98,100); 
line( 28, 303,width/2,height/2);

//Sleeping 
stroke(278,98,26,56);
curve(92, 490, width/2, height/2, 307, 150, 296, 18);
line( 92, 490,width/2,height/2);
//eating and drinking teal
stroke(223,58,37,56);
line( 447, 63,width/2,height/2);
line( 404, 462,width/2,height/2);
//house hold activities
stroke(359,93,65);
curve(229, 65, width/2, height/2, 282, 256, 214, 43);
line( 446, 63,width/2,height/2);
//housework 
stroke(359,38,90);
line( 268, 100,width/2,height/2);
//Food prep and clean up green
stroke(223,47,70);
line( 266, 96,width/2,height/2);
//Lawn and garden care
stroke(359,99,62);
line( 418, 446,width/2,height/2);
//household manegment
stroke(359,20,93);
line( 496, 232,width/2,height/2);
//consumer purchases
stroke(279,91,53);
line( 246, 462,width/2,height/2);
//careing for household members/children
stroke(359,13,92);
line( 297, 95,width/2,height/2);
stroke(359,13,92);
line( 313, 96,width/2,height/2);
//Leasure and sports 
stroke(279,25,78);
line( 495, 499,width/2,height/2);
stroke(279,25,78);
line( 457,454,width/2,height/2);
//Socilizing and comunicating
stroke(279,39,47);
line( 582, 315,width/2,height/2);
stroke(279,39,47);
line( 350,72,width/2,height/2);
//Watching television
stroke(279,99,94);
line( 524,322,width/2,height/2);
line(423,404,width/2,height/2);
//work
stroke(320,59,62);
line( 70,451,width/2,height/2);
line(443,288,width/2,height/2);
//school work
stroke(320,47,99);
line( 475,266,width/2,height/2);
line(443,288,width/2,height/2);
  
  //Title
fill(320,0,0);
textSize(21);
text("Average time per day spent on basic activities",65,150);
noFill();

