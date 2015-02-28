
/**
* The GA class is basic class that implements a basic GA interface.
* on its own it does not do any ga stuff.
* Extend: Generate(), getScore and breedMethod to create a new version.
* 
**/

abstract class GA
{
  //holds the score of each individual in the population.
  float [] score =  new float[popSize];
  
  /** on initalisation calls the geneate method.
  **/
  GA()
  {
    println("new GA object created");
    generate();
  }
    
  /**
  * Abstract methods.
  **/
  //generates inital population
  abstract void generate();
  //returns the generated score for an indivdual in population.
  abstract float getScore(int individual);
  //breeds populations
  abstract void breed();

  
  
  
  /**
  * Normally called to generate a new generation. First evaluates then breeds.
  **/
  final public void newGeneration()
  {
    evaluation();
    breed();
  }
  
  
  /**
  * A generic Evaluation algorithm. 
  * Loops through each individual and scores them with the method getScore() (currently absract).
  * getScore can be extended for the particular circumastance.
  * Method also keeps track of the average and best in the population.
  */
  final private void evaluation()
  {
    float average = 0.0;
    float bestScore = 0.0;
    bestIndividual = 0;
    
    for (int i = 0; i < popSize; i++) {
      float individualScore = getScore(i);
      
      score[i] = individualScore;
      average += individualScore;
      
      if(individualScore > bestScore) { 
        bestScore = individualScore;
        bestIndividual = i;
      }
    }
    average = average / popSize;
    println(average + "\t" + bestScore);
  }
}


class GAArchiKluge extends GA
{ 
  /*ArchiKludge uses Steady State GA, with random selection*/
  
  float mutation = 0.1; //percentage of new generation to come from mutation
  float crossover = 0.7; //percentage of new generation to come from crossover - rest from elitism
  float mutationAmount = 0.05; //percentage of individual to replace

  /**
  Genrates new popualtion
  */
  public void generate()
  {
    genearteMethods GM = new genearteMethods();
    population = GM.generateRandom(popSize, x*y*z);
  }
  
   /**
   Evaluate individual
   */
  public float getScore(int individual)
  {
    float individualScore = 2.0;
    
    shortestPath path = new shortestPath(individual);
    individualScore = path.averagePath();

    return individualScore;
  }
  
  
  /**
  * For n % of the population.
  * Randomly selects 2 parents from the population. 
  * This should be roullett wheel, but it is random in ArchiKluge
  * Then crosses over.
  * n % of the time it also performs mutation at this stage.
  */
  public void breed()
  {
    int i = 0;
    
    //generates by corssover
    for(; i < popSize * crossover; i++)
    {
      int [] parents = selectParents();
      int child = selectSlot(parents);
      crossover(parents[0], parents[1], child);
    }
    
    //generates by mutation
    for(; i < popSize * crossover + popSize * mutation; i++)
    {
      int [] parents = selectParents();
      mutate(parents[0]);
    }
    
  }
  
  /**
  * Randomly selects 2 parents from the population. 
  * This should be roulette wheel, but it is random in ArchiKluge
  *@return an array of the location of parent 1 and parent 2
  */
  private int[] selectParents()
  {
    int[] parent = new int[2];
    parent[0] = floor(random(popSize));
    parent[1] = floor(random(popSize));
    while (parent[0]==parent[1]) {//makes sure the parents are not the same
      parent[1] = floor(random(popSize));
    }
    return parent;
  }
  
  /**
  * Selects what individual should be replaced in mutation
  * For ArchiKluge this is the weakest parent - the parent with the lowest score
  *@return the id of the weakest parent
  */
  private int selectSlot(int parents[]) 
  {
    if(score[parents[0]] < score[parents[1]]) {
      return parents[0];
    }else {
      return parents[1];
    }
  }
  
  /**
  * Crosses over the two parents, at a single random cross over point. And places into the child slot.
  *@param parentA the parent
  *@param parentB the parent
  *@param child where the result is placed
  */
  private void crossover(int parentA, int parentB, int child)
  {
    int sizeOfChild = x*y*z;
    int crossOverPoint = floor(random(sizeOfChild));
    //println(parentA + " " + parentB + " " + child);
    
    for(int i = 0; i < sizeOfChild; i++) 
    {
      if(i < crossOverPoint) 
      {
        population[child][i] = population[parentA][i];
      } else {
        population[child][i] = population[parentB][i];
      }
    }
  }
  
  /**
  * Takes the passed individual and makes mutationamount% of it random.
  *@param individual
  */
  private void mutate(int individual)
  {
    int sizeOfChild = x*y*z;
    for(int i = 0; i < sizeOfChild; i++) 
    {
      float r = random(1);
      if(r < mutationAmount) 
      {
        int rf = floor(random(2));
        population[individual][i] = (rf == 0) ? true : false;//true: true;//
      }
    }
  }
}

