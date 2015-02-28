
/*
      Cette classe permet de représenter l'ensemble de couleurs qui dessinera
      l'ensemble de julia.
      Les couleurs de sont stockées dans un tableau, et les indices correspondent
      au temps qu'il faut à un point du plan complexe pour s'échaper. Ainsi, les
      couleurs d'indice élevé correspondent aux pooints qui mettent longtemps à
      sortir du plan.
*/

class ColorSet
{
  int[][] colors;
  
  public ColorSet(int nbColors)
  {
    this.colors = new int[nbColors][3];
    
    this.resetColors(0, 0, 0, 255, 255, 255);
  }
  
  // Change le nombre de couleur (typiquement quand le seuil d'échappement est modifié)
  public void setColorsNb(int nb)
  {
    if((nb > 1) && (nb != colors.length))
    {
      // On récupère les anciennes couleurs
      int r0 = colors[0][0], g0 = colors[0][1], b0 = colors[0][2],
          r1 = colors[colors.length - 1][0],
          g1 = colors[colors.length - 1][1],
          b1 = colors[colors.length - 1][2];
      this.colors = new int[nb][3];
      this.resetColors(r0, g0, b0, r1, g1, b1);
    }
  }
  
  // Étale un dégradé entre les couleurs r0g0b0 et r1g1b1
  public void resetColors(int r0, int g0, int b0, int r1, int g1, int b1)
  {
    for(int i = 0; i < colors.length; i++)
    {
      colors[i][0] = i * (r1 - r0) / (colors.length - 1) + r0;
      colors[i][1] = i * (g1 - g0) / (colors.length - 1) + g0;
      colors[i][2] = i * (b1 - b0) / (colors.length - 1) + b0;
    }
  }
  
  // met n'importe quelles couleurs dans l'ensemble
  public void randomize()
  {
    for(int i = 0; i < colors.length; i++)
    {
      colors[i][0] = (int) random(255);
      colors[i][1] = (int) random(255);
      colors[i][2] = (int) random(255);
    }
  }
  
  public int[] getColor(int index)
  {
    return colors[index];
  }
  
  public int getColorsNb()
  {
    return this.colors.length;
  }
}

