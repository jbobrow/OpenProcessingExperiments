
int hom=-280;//move to 5
int mar=420;//move to 5
int bar1=-330;//move ot 5
int bar2=-330;//move to 5
int magg=300;//move to 5
int lis1=250;//move to 5
int lis2=-290;//move to 5

void setup(){
  size(600,600);
  background(0);
  noStroke();
}

void draw(){
  background(0);
//6 dots on first hump
hom=hom+1;//original position
hom=min(0,hom);//stop
fill(255);
ellipse(100+hom,150,20,20);//line 1 #1
ellipse(125+hom,150,20,20);//line 1 #2
ellipse(115+hom,175,20,20);//line 2 #1
ellipse(140+hom,175,20,20);//line 2 #2
ellipse(125+hom,200,20,20);//line 3 #1
ellipse(150+hom,200,20,20);//line 3 #2

//first hump
ellipse(130+hom,225,20,20);//line 4 #1
ellipse(155+hom,225,20,20);//line 4 #2
ellipse(130+hom,250,20,20);//line 5 #1
ellipse(155+hom,250,20,20);//line 5 #2
ellipse(130+hom,275,20,20);//line 6 #1
ellipse(155+hom,275,20,20);//line 6 #2
ellipse(130+hom,300,20,20);//line 7 #1
ellipse(155+hom,300,20,20);//line 7 #2
ellipse(130+hom,325,20,20);//line 8 #1
ellipse(155+hom,325,20,20);//line 8 #2
ellipse(130+hom,350,20,20);//line 9 #1
ellipse(155+hom,350,20,20);//line 9 #2
ellipse(130+hom,375,20,20);//line 10 #1
ellipse(155+hom,375,20,20);//line 10 #2
ellipse(130+hom,400,20,20);//line 11 #1
ellipse(155+hom,400,20,20);//line 11 #2
ellipse(130+hom,425,20,20);//line 12 #1
ellipse(155+hom,425,20,20);//line 12 #2

//diagonal circles in between hump 1 and 2
mar=mar-1;//original position
mar=max(0,mar);//stop
ellipse(170+mar,180,20,20);//diagonal circles
ellipse(180+mar,205,20,20);//diagonal circles

//6 dots on second hump
bar1=bar1+1;//original position
bar2=bar2+1;//original positoin
bar1=min(0,bar1);//stop
bar2=min(0,bar2);//stop
ellipse(180+bar1,150+bar2,20,20);//line 1 #1
ellipse(205+bar1,150+bar2,20,20);//line 1 #2
ellipse(195+bar1,175+bar2,20,20);//line 2 #1
ellipse(220+bar1,175+bar2,20,20);//line 2 #2
ellipse(205+bar1,200+bar2,20,20);//line 3 #1
ellipse(230+bar1,200+bar2,20,20);//line 3 #2
//second hump
ellipse(205+bar1,225+bar2,20,20);//line 4 #1
ellipse(230+bar1,225+bar2,20,20);//line 4 #2
ellipse(205+bar1,250+bar2,20,20);//line 5 #1
ellipse(230+bar1,250+bar2,20,20);//line 5 #2
ellipse(205+bar1,275+bar2,20,20);//line 6 #1
ellipse(230+bar1,275+bar2,20,20);//line 6 #2
ellipse(205+bar1,300+bar2,20,20);//line 7 #1
ellipse(230+bar1,300+bar2,20,20);//line 7 #2
ellipse(205+bar1,325+bar2,20,20);//line 8 #1
ellipse(230+bar1,325+bar2,20,20);//line 8 #2
ellipse(205+bar1,350+bar2,20,20);//line 9 #1
ellipse(230+bar1,350+bar2,20,20);//line 9 #2
ellipse(205+bar1,375+bar2,20,20);//line 10 #1
ellipse(230+bar1,375+bar2,20,20);//line 10 #2
ellipse(205+bar1,400+bar2,20,20);//line 11 #1
ellipse(230+bar1,400+bar2,20,20);//line 11 #2
ellipse(205+bar1,425+bar2,20,20);//line 12 #1
ellipse(230+bar1,425+bar2,20,20);//line 12 #2

//2 diagonal circles in between hump 2 and 3
ellipse(245+lis1,180+lis2,20,20);//diagonal circles
ellipse(255+lis1,205+lis2,20,20);//diagonal circles

//fisrt 6 dots on hump #3
lis1=lis1-1;//original positoin
lis2=lis2+1;//original positoin
lis1=max(0,lis1);//stop
lis2=min(0,lis2);//stop
ellipse(255+lis1,150+lis2,20,20);//line 1 #1
ellipse(280+lis1,150+lis2,20,20);//line 1 #2
ellipse(270+lis1,175+lis2,20,20);//line 2 #1
ellipse(295+lis1,175+lis2,20,20);//line 2 #2
ellipse(280+lis1,200+lis2,20,20);//line 3 #1
ellipse(305+lis1,200+lis2,20,20);//line 3 #2
//hump three
ellipse(280+lis1,225+lis2,20,20);//line 4 #1
ellipse(305+lis1,225+lis2,20,20);//line 4 #2
ellipse(280+lis1,250+lis2,20,20);//line 5 #1
ellipse(305+lis1,250+lis2,20,20);//line 5 #2
ellipse(280+lis1,275+lis2,20,20);//line 6 #1
ellipse(305+lis1,275+lis2,20,20);//line 6 #2
ellipse(280+lis1,300+lis2,20,20);//line 7 #1
ellipse(305+lis1,300+lis2,20,20);//line 7 #2
ellipse(280+lis1,325+lis2,20,20);//line 8 #1
ellipse(305+lis1,325+lis2,20,20);//line 8 #2
ellipse(280+lis1,350+lis2,20,20);//line 9 #1
ellipse(305+lis1,350+lis2,20,20);//line 9 #2
ellipse(280+lis1,375+lis2,20,20);//line 10 #1
ellipse(305+lis1,375+lis2,20,20);//line 10 #2
ellipse(280+lis1,400+lis2,20,20);//line 11 #1
ellipse(305+lis1,400+lis2,20,20);//line 11 #2
ellipse(280+lis1,425+lis2,20,20);//line 12 #1
ellipse(305+lis1,425+lis2,20,20);//line 12 #2

//arc on the outside
magg=magg-1;//original positoin
magg=max(0,magg);//stop
ellipse(330+magg,250,20,20);//diagonal circle
ellipse(340+magg,225,20,20);//diagonal
ellipse(365+magg,225,20,20);//next to the diagonal circle

ellipse(355+magg,250,20,20);//arc 1
ellipse(380+magg,250,20,20);//arc 1
ellipse(365+magg,275,20,20);//arc 2
ellipse(390+magg,275,20,20);//arc 2
ellipse(370+magg,300,20,20);//arc 3
ellipse(395+magg,300,20,20);//arc 3
ellipse(365+magg,325,20,20);//arc 4
ellipse(390+magg,325,20,20);//arc 4
ellipse(360+magg,350,20,20);//arc 5
ellipse(385+magg,350,20,20);//arc 5
ellipse(350+magg,375,20,20);//arc 6
ellipse(375+magg,375,20,20);//arc 6
ellipse(340+magg,400,20,20);//arc 7
ellipse(365+magg,400,20,20);//arc 7
ellipse(330+magg,425,20,20);//arc 8

//3 dots alone like a foot
ellipse(270+magg,465,20,20);//highest
ellipse(245+magg,475,20,20);//middle
ellipse(220+magg,485,20,20);//lowest

//6 dots alon elike a foot
ellipse(290,450+lis2,20,20);//highest
ellipse(315,450+lis2,20,20);//highest
ellipse(300,475+lis2,20,20);//middle
ellipse(325,475+lis2,20,20);//middle
ellipse(310,500+lis2,20,20);//lowest
ellipse(335,500+lis2,20,20);//lowest


}

