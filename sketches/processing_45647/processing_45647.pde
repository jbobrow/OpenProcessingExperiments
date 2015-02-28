
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float speed = 3;
float SMOOTHING = 0.15;
float vol = 0;


PImage radio;
float x = 60;
float z= 0;


void setup() {
size(500,400);
radio =loadImage("radiooo.png");
 frameRate(40);
 noStroke();
 rectMode(CORNER);
 
  minim = new Minim(this);
  audio = minim.loadFile("nobody sing to me.mp3");
  audio.loop();  

}

void draw () {

//  
vol = lerp(vol, audio.mix.level(), SMOOTHING);
speed = audio.mix.level();
//


  background(255);
  image(radio,80,200,350,180);




//b circle_L
  fill(z,z,z);
  ellipse(150,325,80-vol*300,80-vol*300);
//

// s circle_L
    fill(z,z,z,120);
  ellipse(150,325,60-vol*300,60-vol*100);
//if (x<x-vol*200) {
//  fill(250,200,0);}

//

// b circle_r
  fill(z,z,z);
  ellipse(355,325,80-vol*300,80-vol*300);
//

// s circle_r
    fill(z,z,z,120);
  ellipse(355,325,60-vol*300,60-vol*100);
//



//1
if(mouseY<200) {
  fill(220,0,0,150);
rect(0,0,50,300-vol*500);}
else{
fill(random(10,200));;
rect(0,0,80,150-vol*200);}

//2
if(mouseY<100) {
  fill(20,110,0,100);
rect(z+30,z,50,200-vol*300);}
else{
fill(random(10,100));
rect(z+30,z,40,250-vol*400);}

//3
if(mouseX < 60) {
  fill(100,20,108,180);
rect(z+65,z,30,180-vol*400);}
else{
fill(random(10,200));
rect(z+70,z,60,190-vol*200);}

//4
if(mouseX<100) {
  fill(0,110,0,120);
rect(z+100,z,30,250-vol*300);}
else{
fill(random(10,10));
rect(z+100,z,30,220-vol*400);}
//

//5
if(mouseX<200) {
  fill(255,20,147,150);
rect(z+130,z,80,300-vol*500);}
else{
fill(random(10,200));;
rect(z+130,z,60,150-vol*200);}

//6
if(mouseY<100) {
  fill(20,110,0,100);
rect(z+170,z,50,200-vol*300);}
else{
fill(random(10,100));
rect(z+170,z,40,250-vol*400);}

//7
if(mouseX < 60 &&mouseY<150) {
  fill(0,191,255,180);
rect(z+210,z,30,180-vol*400);}
else{
fill(random(10,200));
rect(z+210,z,60,190-vol*200);}

//8
if(mouseX<100) {
  fill(0,191,255,120);
rect(z+100,z,30,250-vol*300);}
else{
fill(random(10,10));
rect(z+100,z,30,220-vol*400);}

//9
if(mouseX<130) {
  fill(220,0,0,150);
rect(z+130,z,50,300-vol*500);}
else{
fill(random(10,200));;
rect(z+130,z,80,150-vol*200);}

//10
if(mouseX<150) {
  fill(118,238,0,100);
rect(z+200,z,50,200-vol*300);}
else{
fill(random(10,100));
rect(z+200,z,40,250-vol*400);}

//11
if(mouseX < 170) {
  fill(100,20,108,180);
rect(z+220,z,30,180-vol*400);}
else{
fill(random(10,200));
rect(z+230,z,60,190-vol*200);}

//12
if(mouseX<220) {
  fill(178,58,238,120);
rect(z+260,z,30,250-vol*300);}
else{
fill(random(10,10));
rect(z+270,z,30,220-vol*400);}
//

//13
if(mouseY<260) {
  fill(220,0,0,150);
rect(z+300,z,80,300-vol*500);}
else{
fill(random(10,200));;
rect(z+300,z,60,150-vol*200);}

//14
if(mouseY<300) {
  fill(178,58,238,100);
rect(z+350,z,50,200-vol*300);}
else{
fill(random(10,100));
rect(z+350,z,40,250-vol*400);}

//15
if(mouseX <340) {
  fill(255,255,0,180);
rect(z+390,z,50,180-vol*400);}
else{
fill(random(10,200));
rect(z+390,z,60,190-vol*200);}

//16
if(mouseX<380) {
  fill(255,0,255,200);
rect(z+450,z,50,250-vol*300);}
else{
fill(random(10,50));
rect(z+450,z,50,220-vol*400);}




}

  

  

