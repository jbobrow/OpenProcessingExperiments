
size(200,200);
background(191,239,255);
smooth();
noStroke();
int wYolk = width*40/200;
int hYolk = height*40/200;
int wEgg = width*60/200;
int hEgg = height*80/200;
int xEgg = width*50/200;//x coordinate of Egg position
int yEgg = height*60/200;//y coordinate of Egg position
int xYolk = width*50/200; //x coordinate of Yolk Position
int yYolk = height*70/200;//y coordinate of Yolk position

strokeWeight(width*30/200);
stroke(255,99,71);
line(xEgg+width/2, yEgg+width/7, xEgg+width/2, yEgg-width/7);//Bacon upper right corner
line(xEgg, yEgg+width*60/200, xEgg, yEgg+height*115/200);// Bacon left lower corner

stroke(255);
strokeWeight(5);
//line 1
line(width*145/200,height*25/200, width*145/200,height*45/200);
line(width*145/200-3,height*25/200+20, width*145/200-3,height*45/200+30);
line(width*145/200-2,height*25/200+40, width*145/200-2,height*45/200+40);
line(width*145/200,height*25/200+60, width*145/200,height*45/200+45);
// line 2
line(width*145/200 + 12,height*25/200+3, width*145/200 + 12,height*45/200+3);
line(width*145/200 +15,height*25/200+20, width*145/200+15,height*45/200+30);
line(width*145/200+14,height*25/200+40, width*145/200+14,height*45/200+40);
line(width*145/200+11,height*25/200+60, width*145/200+11,height*45/200+53);

line(width*45/200,height*125/200, width*45/200,height*145/200);
line(width*45/200-3,height*125/200+20, width*45/200-3,height*145/200+30);
line(width*45/200-2,height*125/200+40, width*45/200-2,height*145/200+40);
line(width*45/200,height*125/200+10, width*45/200,height*145/200+10);

line(width*45/200 + 12,height*125/200+3, width*45/200 + 12,height*145/200+3);
line(width*45/200 +15,height*125/200+20, width*45/200+15,height*145/200+30);
line(width*45/200+14,height*125/200+40, width*45/200+14,height*145/200+30);
line(width*45/200+11,height/2+15, width*45/200+11,height/2+30);

noStroke();
ellipse(xEgg,yEgg,wEgg,hEgg);//Egg A left upper corner
color yellow = color(255, 255,0);
fill(yellow);
ellipse(xYolk, yYolk ,wYolk,hYolk);



fill(255); //Egg C right lower corner
ellipse(xEgg+width/2, yEgg+height*90/200, wEgg, hEgg);
fill(yellow);
ellipse(xYolk+width/2, yYolk+height*90/200,wYolk,hYolk);







