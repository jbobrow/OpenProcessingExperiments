
void setup () {
 size (600,600);
 background(255);
}

void draw () {
//face
noStroke();
fill(245,216,178,50);
rectMode( CENTER );
rect(width/2, height/2, 250, 250);
//eyebrows
fill(137,82,11,80);
rect(240,210, 60, 10);
rect(365,210, 60, 10);

//eyes

fill(80,79,79,100);

ellipse(240,245,15, 15);
ellipse(365,245,15, 15);

//nose
fill(3,3,3,50);
ellipse(300, 260, 2, 2);
ellipse(310, 260, 2, 2);

//lips
strokeWeight(2);
fill(214,151,167,75);

rect(300, 350, 220, 120, 35);

//upper teeth
strokeWeight(0);
fill(255);
rect(228, 303,25,25,3,3,12,12);
rect(253, 303,25,25,3,3,12,12);
rect(278, 303,25,25,3,3,12,12);
rect(303, 303,25,25,3,3,12,12);
rect(328, 303,25,25,3,3,12,12);
rect(353, 303,25,25,3,3,12,12);
rect(378, 303,25,25,3,3,12,12);

//bottom teeth
rect(228, 398,25,25,12,12,3,3);
rect(253, 398,25,25,12,12,3,3);
rect(278, 398,25,25,12,12,3,3);
rect(303, 398,25,25,12,12,3,3);
rect(328, 398,25,25,12,12,3,3);
rect(353, 398,25,25,12,12,3,3);
rect(378, 398,25,25,12,12,3,3);

//head
noStroke();
fill(133,183,180,80);
arc(176,175,498,225,TWO_PI-PI/2, TWO_PI);

}








