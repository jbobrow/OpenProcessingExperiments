
import ddf.minim.AudioPlayer;
import ddf.minim.Minim;

static int SALTO = 15;
static int GRAVEDAD = 2;
static int TAMANO = 1;
int x;
int y;
PImage fondo;
PImage fondoCasa;
PImage barras;
PImage adornoBarras;
PImage negro1;
PImage negro2;
PImage negro3;
boolean inicio;
int frame2;
boolean pause;
ArrayList nivel;
ArrayList pjs;
AudioPlayer player2;
Minim minim2;

void setup() 
{
  	x = 800;
	y = 600;
	size(800,600);
	frameRate(30);

	fondoCasa = loadImage("FondoCasa.png");
	barras = loadImage("Barras.png");
	adornoBarras = loadImage("AdornoBarras.png");
	negro1 = loadImage("Negro1.png");
	negro2 = loadImage("Negro2.png");
	negro3 = loadImage("Negro3.png");

	minim2 = new Minim(this);
        player2 = minim2.loadFile("sarias.mp3");
        player2.loop();

	nivel = getHyrule();
	player2.setGain(-20);
	strokeWeight(10);
	fill(0);

        reset();
}

void reset()
{
  	inicio = true;
	pause = false;
	// load a file, give the AudioPlayer buffers that are 1024 samples long
	// player = minim.loadFile("groove.mp3");
	// load a file, give the AudioPlayer buffers that are 2048 samples long
	frame2 = 0;

	fondo = loadImage("Titulo.png");
        background(fondo);
	pjs = new ArrayList();
	pjs.add(new Personaje(1, 50, y*50/100, 100, 0, 'D', 50,"Mario", "Normal", minim2));
	pjs.add(new Personaje(2, 500, y*50/100, 100, 0, 'I', 50,"Luigi", "Normal", minim2));
}

void draw()
{
	if(!pause)
	{
		ganador();
                
		frame2++;
		if(frame2 == 31)
		{
			frame2 = 0;
		}
		if(!inicio)
		{	
			background(fondo);
			//for(Personaje pj : pjs)
                        for(int i=0; i<pjs.size(); i++)
			{
                                Personaje pj = (Personaje)pjs.get(i);
				pj.setFrame(frame2);
				pj.setEnPlataforma(enPiso(pj, nivel));
				pj.paint();
                                if(pj.getVida() < 11 && pj.heart )
                                {
                                    musica("heartbeat.wav");
                                    pj.heart = false;
                                }
			}
			image(barras,20,490);
			//for(Personaje pj : pjs)
                        for(int i=0; i<pjs.size(); i++)
			{
                                Personaje pj = (Personaje)pjs.get(i);
                                if(pj.getId() == 1)
				{
					if(pj.getVida() <= 0)
					{
						image(negro2,20,492);
					}
					if(pj.getVida() < 100)
					{
						image(negro3,301,492);	
					}
					if(pj.getVida() < 92)
					{
						stroke(0);
						fill(0);
						int y = pj.getVida();
						if(pj.getVida() <= 0)
						{
							y = 7;
						}
						float x =((100-y)*(float)2.9);
						rect(310-x, 498, x, 21);
					}
				}
				else if(pj.getId() == 2)
				{
					if(pj.getVida() <= 0)
					{
						image(negro3,754,490);
					}
					if(pj.getVida() < 100)
					{
						image(negro2,472,490);
					}
					if(pj.getVida() < 92)
					{
						stroke(0);
						fill(0);
						int y = pj.getVida();
						if(pj.getVida() <= 0)
						{
							y = 7;
						}
						float x =((100-y)*(float)2.9);
						rect(485, 497, x, 21);
					}
				}
				pj.pintapoderes();
                               if(pj.accion.equals("Martillo"))
		                {
      			            int x2 = pj.getPosicionX();
      			            int y2 = pj.getPosicionY();
                                    int z2 = pj.getAncho();
      			            int id2 = pj.getId();
              			    char dir2 = pj.getDireccion();
                                    boolean martillo = pj.getMartillo();
              			    //for(Personaje per : pjs)
                                    if(dir2 == 'D')
                                    {
                                      x2+= 70;
                                    }
                                    else
                                    {
                                      x2-= 20;
                                    }
                                    y2-=30;
              		       	    for(int j=0; j<pjs.size() && !martillo; j++)
              	                    {
                                      Personaje per = (Personaje)pjs.get(j);
                                      
                                      for(int k=0; k<per.getAncho(); k++)
      	                              {
        //point(x2+k/8, y2);
                                        if(x2 < per.getPosicionX()+k && 
      				           x2+z2/8 > per.getPosicionX()+k &&
				           y2 < per.getPosicionY() && 
				           y2 > per.getPosicionY()-per.getAltura() && 
				           per.getId() != id2)
				           {
					      per.hit(2);
					      per.coil(dir2);
					      per.setCoil(true);
                                              pj.setMartillo(true);
                                              musica("clank.wav");
                                              break;                           
				           }
                                      }
				
			        }
			}
                                
			image(fondoCasa,563,287);
			image(adornoBarras,14,484);		
		}
            }
	}
	else
	{
		fill(0,1);
		rect(0, 0, 800, 600);
	}
}

public void keyPressed() 
{
	if(inicio)
	{
		inicio = false;
		fondo = loadImage("Fondo.png");
	}
	else
	{
		//for(Personaje pj : pjs)
                for(int i=0; i<pjs.size(); i++)
	        {
                        Personaje pj = (Personaje)pjs.get(i);
                        if(!pj.fantasma())
                        {
                          pj.accion(keyCode);
                        }
		}
	}
	//for(Personaje pr : pjs)
        for(int i=0; i<pjs.size(); i++)
	{
                Personaje pr = (Personaje)pjs.get(i);
		if(pr.getCommandos()[3] == keyCode && pr.accion.equals("Ataque"))
		{
			int x = pr.punoX();
			int y = pr.punoY();
                        //point(x,y);
			int id = pr.getId();
			char dir = pr.getDireccion();
			//for(Personaje per : pjs)
			for(int j=0; j<pjs.size(); j++)
	                {
                                Personaje per = (Personaje)pjs.get(j);
				if(x > per.getPosicionX() && 
						x < per.getPosicionX()+per.getAncho() &&
						y < per.getPosicionY() && 
						y > per.getPosicionY()-per.getAltura() && 
						per.getId() != id)
				{
                                        musica("coin.wav");
					per.hit(2);
					per.coil(dir);
					per.setCoil(true);
				}
			}
		}
                
	}
}

public void mouseReleased()
{
	//420,550    540,588
	if(mouseX >= 420 && mouseX <= 540 && mouseY >= 550 && mouseY <= 588)
	{
		pause = !pause;
	}
	else if(mouseX >= 221 && mouseX <= 343 && mouseY >= 550 && mouseY <= 588)
	{
		stop();
		reset();
	}
}

public void ganador()
{
	//for(Personaje pr : pjs)
        for(int i=0; i<pjs.size(); i++)
	{
                Personaje pr = (Personaje)pjs.get(i);
		if(pr.getVida() <= 0 && pr.getPosicionY() < -20)
		{
			stop();
			reset();
		}
	}
}

public void keyReleased() 
{
	if(inicio)
	{
		inicio = false;
		fondo = loadImage("FONDO1.png");
	}
	else
	{
		//for(Personaje pj : pjs)
                for(int i=0; i<pjs.size(); i++)
	        {
                        Personaje pr = (Personaje)pjs.get(i);
			pr.accionUn(keyCode);
		}
	}
}

public boolean enPiso(Personaje pj, ArrayList obstaculos)
{
	boolean esta = false;
	//for(Obstaculo obs : obstaculos)
        for(int i=0; i<obstaculos.size(); i++)
        {
                Obstaculo obs = (Obstaculo)obstaculos.get(i);
		esta = obs.encima(pj);
		if(esta)
		{
			break;
		}
	}
	ArrayList poderes = pj.getPoderes();
	ArrayList borrar = new ArrayList();
	boolean esta2 = false;
	//for(Poder pod : poderes)
        for(int i=0; i<poderes.size(); i++)
        {
                Poder pod = (Poder)poderes.get(i);
		if(pod.isPego())
		{
			if(pod.getGama() <= 0)
			{
				borrar.add(pod);
			}
		}
		else
		{
			//for(Personaje per : pjs)
			for(int j=0; j<pjs.size(); j++)
	                {
                                Personaje per = (Personaje)pjs.get(j);
				if(pod.getPosicionX() > per.getPosicionX() && 
						pod.getPosicionX() < per.getPosicionX()+per.getAncho() &&
						pod.getPosicionY() < per.getPosicionY() && 
						pod.getPosicionY() > per.getPosicionY()-per.getAltura() && 
						pod.getIdPlayer() != per.getId())
				{
					pod.setImagen((PImage)per.getImages().get("Smoke"));
					pod.setPego(true);
					per.hit(1);
				}
			}
			if(pod.getPosicionX() > 820 || pod.getPosicionX() < -10)
			{
				borrar.add(pod);
			}
			else
			{
				//for(Obstaculo obs : obstaculos)
				for(int j=0; j<obstaculos.size(); j++)
                                {
                                        Obstaculo obs = (Obstaculo)obstaculos.get(j);
					if(obs.encima(pod))
					{
						esta2 = true;
						break;
					}
				}
				pod.setEnPlataforma(esta2);
				esta2 = false;
			}
		}
	}
	//for(Poder pod : borrar)
        for(int i=0; i<borrar.size(); i++)
        {
                Poder pod = (Poder)borrar.get(i);
		poderes.remove(pod);
	}
	return esta;
}

public ArrayList getHyrule()
{  
	ArrayList obstaculos = new ArrayList();
	obstaculos.add(new Obstaculo(-800, 460, 0, 9999, 140));
	obstaculos.add(new Obstaculo(268, 366, 0, 98, 20));
	obstaculos.add(new Obstaculo(273, 205, 0, 98, 20));
	obstaculos.add(new Obstaculo(391, 288, 0, 98, 20));
	obstaculos.add(new Obstaculo(636, 288, 0, 67, 20));
	return obstaculos;
}

public void musica(String x)
{
        player2 = minim2.loadFile(x, 100);
        player2.play();
}

public void stop()
{
	minim2.stop();
}

