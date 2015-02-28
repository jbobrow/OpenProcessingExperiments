

private boolean mVisible;

ArrayList<Particle> particles = new ArrayList<Particle>();

int gSizeX = 90;
int gSizeY = 60;

Node[][] grid = new Node[this.gSizeX][this.gSizeY];
ArrayList<Node> active = new ArrayList<Node>();
Material water = new Material(1.0F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F);
Material air = new Material(0.3F, 1.0F, 1.0F, 1.0F, 1.0F, 1.0F);
boolean pressed;
boolean pressedprev;
int mx;
int my;
float mTouchX;
float mTouchY;
int mxprev;
int myprev;

private long currentTime;
private int leftBoundary = 2;

// FPS display
private int mFrameCounter;

void setup() {
  size(720,480);
  PFont f;
  f = loadFont("Verdana-20.vlw"); 
  textFont(f, 8);
  fill(#1C6BA0);
  //smooth();
  //noStroke();
  //
  
  for (int i = 0; i < (this.gSizeX); i++) {
    for (int j = 0; j < this.gSizeY; j++) {
      this.grid[i][j] = new Node();
    }
  }

  for (int i = leftBoundary + 1; i < (gSizeX - 20); i++) {
    for (int j = (gSizeY / 2); j < (gSizeY - 10); j++) {
      Particle p = new Particle(this.water, i, j, 0.0F, 0.0F);
      this.particles.add(p);
    }
  }
  
}

void keyPressed() {
  simulate();
}

ArrayList<Particle> nearbyParticles(Particle p)
{
  return (this.grid[p.cx][p.cy]).associatedParticles;  
}

int calculateMagicSquare(int i, int j)
{
 return (this.grid[i][j + 1].active ? 1 : 0) + (this.grid[i+1][j + 1].active ? 1 : 0) * 2 + (this.grid[i + 1][j].active ? 1 : 0) * 4 + (this.grid[i][j].active ? 1 : 0) * 8; 
}

void draw() {
 simulate();   
  background(#FFFFFF);
  
 for (int i = 0; i < this.gSizeX - 1; i++) {
    for (int j = 0; j < this.gSizeY - 1; j++) {
      int magicSquare = calculateMagicSquare(i,j);
      if (magicSquare != 0) {
        float topLeftX = (i * 8);
        float topLeftY = (j * 8);
       stroke(0,0,255); 
      strokeWeight(3);
        switch (magicSquare) {
         case 1 : case 14: line(topLeftX, topLeftY + 4, topLeftX + 4, topLeftY + 8); break;

         case 5 : line(topLeftX, topLeftY + 4, topLeftX + 4, topLeftY);
           case 2 : case 13: line(topLeftX + 4, topLeftY + 8, topLeftX + 8, topLeftY + 4); break;
         
         case 3 : case 12 : line(topLeftX, topLeftY + 4, topLeftX + 8, topLeftY + 4); break;
         case 10 : line(topLeftX, topLeftY + 4, topLeftX + 4, topLeftY + 8);
           case 4 : case 11: line(topLeftX + 4, topLeftY, topLeftX + 8, topLeftY + 4); break;
         case 6: case 9 : line(topLeftX + 4, topLeftY, topLeftX + 4, topLeftY + 8); break;
         case 7: case 8: line(topLeftX, topLeftY + 4, topLeftX + 4, topLeftY); break;
         //case 15: noStroke(); rect(topLeftX, topLeftY, 8, 8); break;
        }
        
      }
    }
 }

 
  for (Particle p : this.particles) {
      ellipse((8.0F * p.x),(8.0F * p.y), 2, 2);
      //text(p.cy,8.0F * p.x, 8 * p.y);
  }
  /*
   for (int i = 0; i < this.gSizeX; i++) {
    for (int j = 0; j < this.gSizeY; j++) {
      Node n = this.grid[i][j];
      if (n.active && n.associatedParticles.size() > 0)
      {
          float x = i * 8.0;
          float y = j * 8.0;
          //rect(x,y,8,8);
          //stroke(204, 102, 0);
          //line(x, y, x + (n.u * 20), (y + n.v * 20));

          //text(num, 8.0F * i, 8 * j);
        //point((8.0F * i), (8.0F * j));
      }
    }
  }
  */
  
}

void mousePressed() {
  
  int nodeX = (mouseX / 8);
  int nodeY = (mouseY / 8);
  System.out.println(calculateMagicSquare(nodeX, nodeY));
  return;
  /*
  Node n = this.grid[nodeX][nodeY];
  System.out.println(nodeX + "," + nodeY + "| m:" + n.m + " d:" + n.d + " gx:" + n.gx + " gy:" + n.gy + " u:" + n.u + " v:" + n.v + " ax:" + n.ax + " ay:" + n.ay);
  for (Particle p : n.associatedParticles) {
    System.out.println(p.x + "," + p.y);
  }
  */

  /*
  for (int i = 0; i < 30; i++)
  {
    Particle p = new Particle(this.air, (mouseX / 8) + (i * .5), (mouseY / 8), 0.0F, 0.0F);
    p.v = 1;
    p.u = 3;    
    this.particles.add(p);
  }
  */
}

int fix_x(int x) {

    if (x > (gSizeX - 1)) {
        x = 1 + (x - (gSizeX - 1));
    }else if (x < 2) {
      x = (gSizeX) - (2 - x);
    }
  return x;
}

void simulate() {
  boolean drag = false;
  float mdx = 0.0F;
  float mdy = 0.0F;
  if ((this.pressed) && (this.pressedprev)) {
    drag = true;
    mdx = 0.25F * (this.mx - this.mxprev);
    mdy = 0.25F * (this.my - this.myprev);
  }

  this.pressedprev = this.pressed;
  this.mxprev = this.mx;
  this.myprev = this.my;

  for (Node n : this.active) {
    n.m = (n.d = n.gx = n.gy = n.u = n.v = n.ax = n.ay = 0.0F);
    n.active = false;
    n.associatedParticles.clear();
   }
   
   this.active.clear();

			for (Particle p : this.particles) {
				p.cx = (int) (p.x - 0.5F);
				p.cy = (int) (p.y - 0.5F);

				float x = p.cx - p.x;
				p.px[0] = (0.5F * x * x + 1.5F * x + 1.125F);
				p.gx[0] = (x + 1.5F);
				x += 1.0F;
				p.px[1] = (-x * x + 0.75F);
				p.gx[1] = (-2.0F * x);
				x += 1.0F;
				p.px[2] = (0.5F * x * x - 1.5F * x + 1.125F);
				p.gx[2] = (x - 1.5F);

				float y = p.cy - p.y;
				p.py[0] = (0.5F * y * y + 1.5F * y + 1.125F);
				p.gy[0] = (y + 1.5F);
				y += 1.0F;
				p.py[1] = (-y * y + 0.75F);
				p.gy[1] = (-2.0F * y);
				y += 1.0F;
				p.py[2] = (0.5F * y * y - 1.5F * y + 1.125F);
				p.gy[2] = (y - 1.5F);

				for (int i = 0; i < 3; i++) {
					for (int j = 0; j < 3; j++) {
						int cxi = p.cx + i;
						int cyj = p.cy + j;
						Node n = this.grid[(int)fix_x(cxi)][cyj];
                if ((i != 2) && (j != 2)) {
                  n.associatedParticles.add(new Particle(p));
                }
						if (!n.active) {
							this.active.add(n);
							n.active = true;
						}
						float phi = p.px[i] * p.py[j];
						n.m += phi * p.mat.m;
						n.d += phi;
						float dx = p.gx[i] * p.py[j];
						float dy = p.px[i] * p.gy[j];
						n.gx += dx;
						n.gy += dy;
					}
				}
			}

			for (Particle p : this.particles) {
				int cx = (int) p.x;
				int cy = (int) p.y;
				int cxi = cx + 1;
				int cyi = cy + 1;

				float p00 = this.grid[(int)fix_x(cx)][cy].d;
				float x00 = this.grid[(int)fix_x(cx)][cy].gx;
				float y00 = this.grid[(int)fix_x(cx)][cy].gy;
				float p01 = this.grid[(int)fix_x(cx)][cyi].d;
				float x01 = this.grid[(int)fix_x(cx)][cyi].gx;
				float y01 = this.grid[(int)fix_x(cx)][cyi].gy;
				float p10 = this.grid[(int)fix_x(cxi)][cy].d;
				float x10 = this.grid[(int)fix_x(cxi)][cy].gx;
				float y10 = this.grid[(int)fix_x(cxi)][cy].gy;
				float p11 = this.grid[(int)fix_x(cxi)][cyi].d;
				float x11 = this.grid[(int)fix_x(cxi)][cyi].gx;
				float y11 = this.grid[(int)fix_x(cxi)][cyi].gy;

				float pdx = p10 - p00;
				float pdy = p01 - p00;
				float C20 = 3.0F * pdx - x10 - 2.0F * x00;
				float C02 = 3.0F * pdy - y01 - 2.0F * y00;
				float C30 = -2.0F * pdx + x10 + x00;
				float C03 = -2.0F * pdy + y01 + y00;
				float csum1 = p00 + y00 + C02 + C03;
				float csum2 = p00 + x00 + C20 + C30;
				float C21 = 3.0F * p11 - 2.0F * x01 - x11 - 3.0F * csum1 - C20;
				float C31 = -2.0F * p11 + x01 + x11 + 2.0F * csum1 - C30;
				float C12 = 3.0F * p11 - 2.0F * y10 - y11 - 3.0F * csum2 - C02;
				float C13 = -2.0F * p11 + y10 + y11 + 2.0F * csum2 - C03;
				float C11 = x01 - C13 - C12 - x00;

				float u = p.x - cx;
				float u2 = u * u;
				float u3 = u * u2;
				float v = p.y - cy;
				float v2 = v * v;
				float v3 = v * v2;
				float density = p00 + x00 * u + y00 * v + C20 * u2 + C02 * v2
						+ C30 * u3 + C03 * v3 + C21 * u2 * v + C31 * u3 * v
						+ C12 * u * v2 + C13 * u * v3 + C11 * u * v;

				float pressure = density - 1.0F;
				if (pressure > 2.0F) {
					pressure = 2.0F;
				}

				float fx = 0.0F;
				float fy = 0.0F;
/*
				if (p.x < 4.0F)
					fx += p.mat.m * (4.0F - p.x);
				else if (p.x > this.gSizeX - 5) {
					fx += p.mat.m * (this.gSizeX - 5 - p.x);
				}
*/

				if (p.y < 4.0F)
					fy += p.mat.m * (4.0F - p.y);
				else if (p.y > this.gSizeY - 5) {
					fy += p.mat.m * (this.gSizeY - 5 - p.y);
				}

				if (drag) {
					float vx = Math.abs(p.x - 0.25F * this.mx);
					float vy = Math.abs(p.y - 0.25F * this.my);
					if ((vx < 10.0F) && (vy < 10.0F)) {
						float weight = p.mat.m * (1.0F - vx / 10.0F)
								* (1.0F - vy / 10.0F);
						fx += weight * (mdx - p.u);
						fy += weight * (mdy - p.v);
					}
				}

				for (int i = 0; i < 3; i++) {
					for (int j = 0; j < 3; j++) {
						Node n = this.grid[(int)fix_x(p.cx + i)][(p.cy + j)];
						float phi = p.px[i] * p.py[j];
						float gx = p.gx[i] * p.py[j];
						float gy = p.px[i] * p.gy[j];

						n.ax += -(gx * pressure) + fx * phi;
						n.ay += -(gy * pressure) + fy * phi;
					}
				}
			}

    for (Node n : this.active) {
      if (n.m > 0.0F) {
        n.ax /= n.m;
        n.ay /= n.m;
        n.ay += 0.03F;
      }
    }

			for (Particle p : this.particles) {
    
				for (int i = 0; i < 3; i++) {
					for (int j = 0; j < 3; j++) {
						Node n = this.grid[(int)fix_x(p.cx + i)][(p.cy + j)];
						float phi = p.px[i] * p.py[j];
						p.u += phi * n.ax;
						p.v += phi * n.ay;
					}
				}

				float mu = p.mat.m * p.u;
				float mv = p.mat.m * p.v;

				for (int i = 0; i < 3; i++) {
					for (int j = 0; j < 3; j++) {
						Node n = this.grid[(int)fix_x(p.cx + i)][(p.cy + j)];
						float phi = p.px[i] * p.py[j];
						n.u += phi * mu;
						n.v += phi * mv;
					}
				}

			}

			for (Node n : this.active) {
				if (n.m > 0.0F) {
					n.u /= n.m;
					n.v /= n.m;
				}
			}

			for (Particle p : this.particles) {
				float gu = 0.0F;
				float gv = 0.0F;

				for (int i = 0; i < 3; i++) {
					for (int j = 0; j < 3; j++) {
						Node n = this.grid[(int)fix_x(p.cx + i)][(p.cy + j)];
						float phi = p.px[i] * p.py[j];
						gu += phi * n.u;
						gv += phi * n.v;
					}
				}

				p.x += gu;
				p.y += gv;
				p.u += 1.0F * (gu - p.u);
				p.v += 1.0F * (gv - p.v);
/*
				if (p.x < 1.0F) {
					p.x = (1.0F + (float) Math.random() * 0.01F);                                    
					p.u = 0.0F;
				} else if (p.x > this.gSizeX - 2) {
					p.x = (this.gSizeX - 2 - (float) Math.random() * 0.01F);
					p.u = 0.0F;
				}
*/

    if (p.x > gSizeX) {
        p.x = 2 + (p.x - (gSizeX));
    }else if (p.x < 2.0F) {
      p.x = (gSizeX) - (2.0F - p.x);
    }   
  
  
//  if (int)(fix_x) == gSizeX

				if (p.y < 1.0F) {
					p.y = (1.0F + (float) Math.random() * 0.01F);
					p.v = 0.0F;
				} else if (p.y > this.gSizeY - 2) {
					p.y = (this.gSizeY - 2 - (float) Math.random() * 0.01F);
					p.v = 0.0F;
				}


			}

		}



