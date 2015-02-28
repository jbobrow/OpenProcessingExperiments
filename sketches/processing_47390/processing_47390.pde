
public class Death {
  Death() {
  }

  // checks if it's time to die if someone's alive (important so you don't also do already dead people)
  void deathVisit() {
    for (int i=0;i<maxPeople;i++) {
      if (person[i].age > 115 && person[i].alive == true) {
        killPerson(i);
      }
      else {
        if (person[i].age > deathAgeBegin && person[i].alive == true) {
          int deathCalling = person[i].age + (int)(Float.parseFloat(person[i].trait.get("stress").toString()));
          int deathAversion = (int)(Float.parseFloat(person[i].trait.get("health").toString())) + (int)(Float.parseFloat(person[i].trait.get("luck").toString())) - (int)((person[i].age-77) / 2);
          int randomDeathRoll = (int)random(0, 14.99);
          if (deathAversion < randomDeathRoll) {
            killPerson(i);
          }
        }
      }
    }
  }

  void killPerson(int _personID) {
    person[_personID].alive = false;
    person[_personID].display(1);
    populationSize--;
  }
}


