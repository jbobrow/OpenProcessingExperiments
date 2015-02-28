
/*  Classe representant la zone dans laquelle les boids se deplacent */
/* Fait par Mr POINET CHRIS */


class Area
{
  
  /* Liste des boids rouges et bleus*/
  private ArrayList BoidsRedInZone;  
  private ArrayList BoidsBlueInZone;


  /* Index pour le parcours des listes */
  private int index;

  Area()
  {
    /* Initialisation des donnees */
    index = 0;
    BoidsRedInZone = new ArrayList();
    BoidsBlueInZone = new ArrayList();

    /* Création des boids rouges */
    for (index = 0; index < 25; index++)
    {
      Boids b = new Boids( random(0, 800), random(0, 600), random(-1, 1), random(-1, 1), 1 );

      BoidsRedInZone.add(b);
    }

    /* Création des boids bleus */
    for (index = 0; index < 25; index++)
    {
      Boids b = new Boids( random(0, 800), random(0, 600), random(-1, 1), random(-1, 1), 2);

      BoidsBlueInZone.add(b);
    }
  }


  /* S'occupe de mettre a jour les boids */
  public void Update()
  {
    for (index = 0; index < BoidsRedInZone.size(); index++)
    {
      Boids b = (Boids)BoidsRedInZone.get(index);
      b.Update(BoidsRedInZone, BoidsBlueInZone);
    }

    for (index = 0; index < BoidsBlueInZone.size(); index++)
    {
      Boids b = (Boids)BoidsBlueInZone.get(index);
      b.Update(BoidsBlueInZone, BoidsRedInZone);
    }
    
    
    
    /* Verifie si un boid rouge est mort, si oui le supprime de la liste */    
    for (index = BoidsRedInZone.size() - 1; index > 0; index--)
    {
      Boids b = (Boids)BoidsRedInZone.get(index);
      
      if(b.HasToDie())
      {
          BoidsRedInZone.remove(b);
      }
      
    }
    
  }


  /* Affiche les boids   */
  public void DrawArea()
  {
    for (index = 0; index < BoidsRedInZone.size(); index++)
    {
      Boids b = (Boids)BoidsRedInZone.get(index);
      b.DrawBoids();
    }

    for (index = 0; index < BoidsBlueInZone.size(); index++)
    {
      Boids b = (Boids)BoidsBlueInZone.get(index);
      b.DrawBoids();
    }
  }
  
  
  /* Ajoute un boid a la liste des boids rouges */
  public void AddBoid()
  {
      Boids b = new Boids(mouseX, mouseY, random(-1, 1), random(-1, 1), 1 );

      BoidsRedInZone.add(b);
  }
  
}

