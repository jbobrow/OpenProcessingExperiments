
int ligne;
int colonne;
float largeurCase;
float hauteurCase;
int [][] tableau;

void setup()
{
  frameRate(10);
  size(900, 900);
  ligne = 100;
  colonne = 100;
  noStroke();
  
  largeurCase = (float)width / (float)colonne;
  hauteurCase = (float)height / (float)ligne;
  tableau = new int[colonne+2][ligne+2];
}

void draw()
{
  background(255);
  
  // copie le tableau
  int[][] etatPrecedent = new int[colonne+2][ligne+2];
  for  (int i = 1; i < colonne+1; i++){
    for  (int j = 1; j < ligne+1; j++){
      etatPrecedent[i][j] = tableau[i][j];
    }
  }
  
  // pour chaque case
  for  (int i = 1; i < colonne+1; i++){
    for  (int j = 1; j < ligne+1; j++){
      
      // calcule la somme des voisins
      int sommeCases = etatPrecedent[i-1][j-1] + etatPrecedent[i][j-1];
      sommeCases += etatPrecedent[i+1][j-1] + etatPrecedent[i+1][j];
      sommeCases += etatPrecedent[i+1][j+1] + etatPrecedent[i][j+1];
      sommeCases += etatPrecedent[i-1][j+1] + etatPrecedent[i-1][j]; 
      
      // affiche une case si elle est vivante
      if(tableau[i][j] == 1) {
        
        float intensite = sommeCases*30;
        fill(intensite, intensite-intensite*0.8,  intensite-intensite*0.5);
        rect((i-1)*largeurCase, (j-1)*hauteurCase, largeurCase, hauteurCase);
      }
  

  //la touche pressee determine le modele de jeu de la vie (regles differentes)
	 
	  if (key == '1')
	  {
	    // modele 23/3, Conway
		if(sommeCases == 3 )
			{
				tableau[i][j] = 1;
			}
			
		else if(sommeCases > 3 || sommeCases < 2)
			{
				tableau[i][j] = 0;
			}
	  
	  }
	 
	 

      
    
     if (key == '2')
		{
   
        // modele 1/1, Kellie Evans
		if(sommeCases == 1)
			{
				tableau[i][j] = 1;
			}
			
		else if(sommeCases > 2)
			{
				tableau[i][j] = 0;
			}
			
		}
      
     
	if (key == '3')
		{
		
		// modele 3/6
		if(sommeCases == 3 || sommeCases == 6)
			{
				tableau[i][j] = 1;
			}
			
		else if(sommeCases > 3 || sommeCases < 2)
			{
				tableau[i][j] = 0;
			}
      
		}
		
		
	if (key == '4')
		{
          // modele 5/345
		if(sommeCases > 2 && sommeCases < 6 )
			{
				tableau[i][j] = 1;
			}
		else if(sommeCases > 5 || sommeCases < 3)
			{
				tableau[i][j] = 0;
			}
		}
      
	if (key == '5')
		{
           // modele 45678/3
		if(sommeCases > 4 && sommeCases < 9 || sommeCases == 3)
			{
				tableau[i][j] = 1;
			}
		else if(sommeCases < 3 || sommeCases > 8)
			{   
				tableau[i][j] = 0;
			}
			
		}
      
	if (key == '6')
		{ 
			// modele 34678/3678
		if(sommeCases == 3 ||sommeCases == 4 || sommeCases > 5 && sommeCases < 9)
			{
				tableau[i][j] = 1;
			}
		else if(sommeCases > 8 || sommeCases < 3 ||sommeCases == 5)
			{
				tableau[i][j] = 0;
			}
			
		}
      
      
    }
  }
}

// change l'état des cases en cliquant
void mouseDragged()
{
  if(mouseX >= 0 && mouseX <= width
  && mouseY >= 0 && mouseY <= height)
  {
    int coordonneeCaseX = mouseX * colonne / width;
    int coordonneeCaseY = mouseY * ligne / height;
    tableau[coordonneeCaseX+1][coordonneeCaseY+1] = 1;
  }
}

void keyPressed()
{
  // reset an appuyant sur ESPACE
  if(key == ' ')
  {
    tableau = new int[colonne+2][ligne+2];
  }
  // random an appuyant sur R
  if(key == 'r')
  {
    for  (int i = 1; i < colonne+1; i++){
      for  (int j = 1; j < ligne+1; j++){
        tableau[i][j] = (int)random(1.9);
      }
    }
  }
}

