
class Connection
{
  final static float maxWeight = 10.;
  final static float minWeight = -10.;
  //sigma controls how big a change can be made when mutating
  Neuron n1;
  Neuron n2;
  
  float weight;
  
  Connection(Neuron n1, Neuron n2)
  {
    this.n1 = n1;
    this.n2 = n2;
    weight = random(minWeight, maxWeight);
  }
  
  float getSignal()
  {
    return weight*n1.getSignal();
  }
}

