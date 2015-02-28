
void setup(){textFont(createFont("",50));}String c(int i){i=(i%93)+33;return ""+(char)i;}void draw(){fill(0,10);rect(0,0,200,100);filter(11);fill(255);text(c(minute())+c(second())+c(millis()),0,50);}

