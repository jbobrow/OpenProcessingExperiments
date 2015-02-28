
// homework 1
// copyright Molly Nix August 2011 Pittsburgh, PA 15232

size( 400,400);

// color setting
color bg = color(252, 242, 232);
color darkerbg = color(245, 235, 226);
color darkgreen = color(98, 130, 129);
color lightgreen = color(152, 202, 209);
color grey = color(161, 161, 161);
color white = color(255, 255, 255);

color lightgreen_alpha = color(152, 202, 209, 50);
color white_alpha = color(255, 255, 255, 70);

// important pixel points for letters
int ltr_y = int(165);
int m_x = int(93);
int c_x = int(180);
int n_x = int(257);
int s_ltr_y = int(168);
int s_m_x = int(96);
int s_c_x = int(183);
int s_n_x = int(260);
int tri_top1 = int(0);
int tri_top2 = int(150);
int tri_top3 = int(-150);
int tri_top4 = int(300);
int tri_top5 = int(-300);

// smoothing and background setting
smooth();
background(bg);

// argyle background
stroke(white);
fill(lightgreen_alpha);
quad(200, tri_top1-96, 58, tri_top1+200, 200, tri_top1+496, 400-58, tri_top1+200);
quad(200, tri_top4-96, 58, tri_top4+200, 200, tri_top4+496, 400-58, tri_top4+200);
quad(200, tri_top5-96, 58, tri_top5+200, 200, tri_top5+496, 400-58, tri_top5+200);
stroke(lightgreen_alpha);
fill(white_alpha);
quad(200, tri_top2-96, 58, tri_top2+200, 200, tri_top2+496, 400-58, tri_top2+200);
quad(200, tri_top3-96, 58, tri_top3+200, 200, tri_top3+496, 400-58, tri_top3+200);

// ribbon background
stroke(lightgreen_alpha);
fill(white);
rect(18, ltr_y-17, 363, 85);
noStroke();
fill(bg);
triangle(18, ltr_y-17, 18, ltr_y-17+85, 47, ltr_y-17+42);
triangle(400-18, ltr_y-17, 400-18, ltr_y-17+85, 400-47, ltr_y-17+42);
fill(darkerbg);
ellipse(65, ltr_y-17+42, 12, 12);
ellipse(400-65, ltr_y-17+42, 12, 12);

// all shadowed initials
noStroke();
fill(darkerbg);
rect(s_m_x, s_ltr_y, 7, 51);
quad(s_m_x+7, s_ltr_y, s_m_x+32, s_ltr_y+33, s_m_x+32, s_ltr_y+43, s_m_x+7, s_ltr_y+10);
quad(s_m_x+55, s_ltr_y, s_m_x+32, s_ltr_y+33, s_m_x+32, s_ltr_y+43, s_m_x+55, s_ltr_y+10);
rect(s_m_x+55, s_ltr_y, 7, 51);
ellipseMode(CORNER);
arc(s_c_x, s_ltr_y, 16, 14, PI, TWO_PI-PI/2);
rect(s_c_x+8, s_ltr_y, 37, 7);
arc(s_c_x+36, s_ltr_y, 16, 14, TWO_PI-PI/2, TWO_PI);
rect(s_c_x, s_ltr_y+7, 8, 37);
arc(s_c_x, s_ltr_y+36, 16, 14, PI/2, PI);
rect(s_c_x+8, s_ltr_y+44, 37, 7);
arc(s_c_x+36, s_ltr_y+36, 16, 14, 0, PI/2);
quad(s_c_x+45, s_ltr_y+7, s_c_x+53, s_ltr_y+7, s_c_x+53, s_ltr_y+17, s_c_x+45, s_ltr_y+19);
quad(s_c_x+45, s_ltr_y+44, s_c_x+53, s_ltr_y+44, s_c_x+53, s_ltr_y+36, s_c_x+45, s_ltr_y+34);
rect(s_n_x, s_ltr_y, 7, 51);
quad(s_n_x+7, s_ltr_y, s_n_x+7, s_ltr_y+10, s_n_x+49, s_ltr_y+51, s_n_x+49, s_ltr_y+41);
rect(s_n_x+49, s_ltr_y, 7, 51);

// draw M
noStroke();
fill(darkgreen);
rect(m_x, ltr_y, 7, 51);
quad(m_x+7, ltr_y, m_x+32, ltr_y+33, m_x+32, ltr_y+43, m_x+7, ltr_y+10);
quad(m_x+55, ltr_y, m_x+32, ltr_y+33, m_x+32, ltr_y+43, m_x+55, ltr_y+10);
rect(m_x+55, ltr_y, 7, 51);

// draw C
noStroke();
fill(lightgreen);
ellipseMode(CORNER);
arc(c_x, ltr_y, 16, 14, PI, TWO_PI-PI/2);
rect(c_x+8, ltr_y, 37, 7);
arc(c_x+36, ltr_y, 16, 14, TWO_PI-PI/2, TWO_PI);
rect(c_x, ltr_y+7, 8, 37);
arc(c_x, ltr_y+36, 16, 14, PI/2, PI);
rect(c_x+8, ltr_y+44, 37, 7);
arc(c_x+36, ltr_y+36, 16, 14, 0, PI/2);
quad(c_x+45, ltr_y+7, c_x+53, ltr_y+7, c_x+53, ltr_y+17, c_x+45, ltr_y+19);
quad(c_x+45, ltr_y+44, c_x+53, ltr_y+44, c_x+53, ltr_y+36, c_x+45, ltr_y+34);

// draw N
noStroke();
fill(grey);
rect(n_x, ltr_y, 7, 51);
quad(n_x+7, ltr_y, n_x+7, ltr_y+10, n_x+49, ltr_y+51, n_x+49, ltr_y+41);
rect(n_x+49, ltr_y, 7, 51);

// saveFrame("hw1.jpg");


