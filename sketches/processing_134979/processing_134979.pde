
void setup() {
  size(1000, 600);
}  

void draw() {
  background(198,207,204); //sky color
  
  
  rect(0,422,1000,1000); //ocean
  fill(97,131,81); //green
  rect(0,450,1000,75); //green ocean strip
  fill(256,256,256); //white
  triangle (734,467,1000,425,1000,467); //white spec
  
  fill(127,67,13); //brownred
  quad(522,479,793,369,892,412,758,479); //hair
  quad(724,386,743,364,785,364,755,385); //top hair
  fill(241,225,199); //skin tone
  quad(735,384,701,383,700,387,736,414); //neck
  ellipse(769,398,80,60); //head
  
  fill(127,67,13); //brownred
  triangle(796,372,795,422,827,402); //hair bangs?
  
  
  fill(256,256,256); //white
  ellipse(774,385,5,20); //left eye
  ellipse(776,410,5,20); //right eye
  
  ellipse(62,97,300,10); //cloud 1
  ellipse(554,106,150,10); //cloud 2
  ellipse(439,144,100,10); //cloud 3
  ellipse(843,86,200,10); //cloud 4
  ellipse(279,30,250,5); //cloud 5
  ellipse(743,131,125,5); //cloud 6
  ellipse(314,213,300,7); //cloud 7
  ellipse(550,170,225,10); //cloud 8
  ellipse(638,258,400,8); //cloud 9
  
  fill(241,225,199); //skin tone
  quad(675,367,728,314,728,345,701,376); //upper bicep
  quad(728,314,792,361,774,364,728,345); //upper forearm
  ellipse(785,373,20,30); //upper palm
  fill(144,122,85,100); //skin shadow
  ellipse(780,378,5,15); //thumb shadow
  fill(241,225,199); //skin tone
  ellipse(777,371,7,20); //thumb
  quad(576,390,675,367,742,416,626,434); //chest
  arc(683,375,40,30,0,HALF_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI, OPEN); //BOOB
  arc(698,405,40,30,0,HALF_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI,OPEN); //other boob
  quad(696,424,740,416,816,425,830,442); //lower bicep
  quad(816,425,883,411,903,415,830,442); //lower forearm
  ellipse(901,409,30,15); //lower hand
  quad(554,418,573,447,508,459,503,447); //lower leg
  ellipse(590,428,85,40); //lower hip
  ellipse(569,396,75,45); //upper hip
  ellipse(641,401,3,3); //belly button
  quad(436,443,434,457,389,462,419,439); //lower foot
  quad(527,414,515,444,447,450,454,440); //upper calf
  quad(454,440,454,446,426,442,434,430); //upper foot
  quad(503,447,508,459,434,457,436,443); //lower calf
  triangle(532,396,569,418,515,444); //upper leg
  line(745,395,750,408); //mouth
  triangle(757,396,760,403,765,400); //nose
  fill(0,0,0); //black
  ellipse(774,386,5,5); //left pupil
  ellipse(776,412,5,5); //right pupil
  
 
  fill(241,225,199); //skin tone
  ellipse(548,156,50,60); //baby angel 2 head
  
  fill(256,256,256); //white
  ellipse(540,167,10,10); //left eye angel 2
  fill(0,0,0); //black
  ellipse(540,167,3,3); //left pupil angel 2
  
  fill(241,225,199); //skin tone
  quad(531,179,556,185,533,265,473,232); //baby angel 2 body
  quad(548,199,559,185,519,147,521,164); //baby angel 2 right arm
  quad(512,172,512,185,538,187,530,175); //baby angel 2 left arm
  
  quad(606,189,659,197,693,237,664,264); //baby angel 3 body
  quad(606,189,609,139,624,157,626,193); //left leg angel 3
  ellipse(634,183,15,25); //right foot angel 3
  ellipse(626,177,5,15); //angel 3 toe
  
  fill(245,229,203); //angel 5 skin color
  quad(220,196,249,192,313,221,282,240); //angel 5 body
  ellipse(319,243,10,20); //angel 5 right calf
  ellipse(309,239,20,40); //angel 5 right knee
  quad(311,231,316,239,337,231,333,222); //angel 5 left calf
  ellipse(296,235,40,20); //angel 5 left knee
  triangle(236,195,222,198,188,182); //angel 5 left bicep
  triangle(210,188,188,182,180,152); //angel 5 left arm
  ellipse(242,179,35,45); //angel 5 head
  
  fill(225,195,157); //angel 5 haircolor
  quad(237,153,259,162,260,193,240,184); //angel 5 hair
  
  fill(134,134,146); //bluegray
  quad(665,236,656,234,637,240,671,253); //angel 3 left wing
  triangle(707,212,689,224,697,234); //angel 3 right wing
  
  quad(361,222,358,232,326,239,336,220); //angel 4 left wing
  quad(379,221,392,200,413,205,387,222); //angel 4 right wing
  
  fill(241,225,199); //skin tone
  ellipse(682,238,40,50); //angel 3 head
  line(676,248,686,249); //angel 3 left eye
  line(694,246,697,238); //angel 3 right eye
  triangle(660,259,674,262,655,276); //angel 3 left bicep
  quad(655,276,666,270,687,273,683,276); //angel 3 left arm
  quad(700,254,703,246,732,249,720,256); //angel 3 right arm
  
  quad(347,228,384,213,435,274,396,292); //angel 4 body
  ellipse(366,204,40,50); //angel 4 head
  triangle(387,216,395,226,415,186); //angel 4 right bicep
  triangle(415,186,409,195,397,173); //angel 4 right arm
  triangle(349,230,358,243,345,257); //angel 4 left bicep
  triangle(345,257,355,250,373,253); //angel 4 left arm
  line(358,199,366,190); //angel 4 left eye
  line(374,189,378,188); //angel 4 right eye
  triangle(377,193,374,198,379,196); //angel 4 nose
  line(373,207,382,201); //angel 4 mouth
  
  fill(0,0,0); //black
  ellipse(364,191,2,2); //angel 4 left eyeball
  ellipse(377,187,2,2); //angel 4 right eyeball
  
  fill(187,146,92); //angel 4 hair color
  triangle(353,186,351,220,340,201); //angel 4 hair
  
  fill(182,139,96); //angel 3 hair color
  triangle(657,227,686,206,686,233); //angel 3 hair
  
  fill(256,256,256); //white
  quad(579,243,552,220,522,222,565,255); //angel 1 wing left
  triangle(601,221,619,226,618,195); //angel 1 wing right
  
  quad(266,187,297,185,271,203,265,198); //angel 5 right wing
  quad(259,201,256,179,288,169,265,203); //angel 5 left wing
  
  
  fill(226,197,155); //darker skin tone
  quad(628,330,656,304,605,239,563,245); //baby angel 1 body 
  quad(606,236,636,188,641,206,618,256); //baby angel 1 right arm
  ellipse(591,229,50,60); //baby angel 1 head 
  quad(563,245,506,236,522,256,579,267); //baby angel 1 left arm
  
  
  
  fill(127,78,45); //angel 1 hair color
  triangle(567,226,607,207,580,181); //angel 1 hair
  
  fill(183,150,119); //angel 2 hair color
  triangle(525,153,548,127,520,125); //angel 2 left hair
  triangle(552,129,574,156,580,132); //angel 2 right hair
  
  fill(256,256,256); //white eye color
  ellipse(582,235,15,8); //left eye angel 1
  ellipse(606,233,15,8); //right eye angel 1
  ellipse(560,169,10,10); //right eye angel 2
  
  fill(0,0,0); //black
  ellipse(560,169,3,3); //right pupil angel 2 
  ellipse(586,238,3,3); //left pupil angel 1
  ellipse(610,236,3,3); //right pupil angel 1
  
  fill(76,102,117); //dark blue
  triangle(969,545,822,557,1000,600); //far right ocean wave
  triangle(287,492,184,594,500,575); //middle ocean wave
  triangle(99,486,235,577,0,600); //smaller ocean wave
  triangle(398,560,460,506,490,550); //tiny ocean wave
  triangle(0,600,771,517,1000,600); //ocean wave
  fill(77,87,88); //light blue
   
}


