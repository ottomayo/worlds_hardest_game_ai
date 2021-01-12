class Population {
  Player players[];
  float fitnessSum;
  
  int gen = 1;
  int bestPlayer = 0;
  
  int stepsLeft = stepsPerGen;
  int minStep = stepsPerGen;
  
  Population(int size) {
    players = new Player[size];
    
    for(int i = 0; i < size; i++) {
      players[i] = new Player();
    }
  }
  
  
  void show() {
    for(int i = 0; i < players.length; i++) {
      players[i].show();
    }
    players[0].show();
    
    
    fill(255);
    textSize(15);
    text("Generation: " + gen, 15, 30);
    
  }
  
  
  void update() {
    for(int i = 0; i < players.length; i++) {
      if(players[i].brain.step > minStep) {
        players[i].dead = true;
      }
      
      players[i].update();
    }

  }
  
  
  void calculateFitness() {
    for(int i = 0; i < players.length; i++) {
      players[i].calculateFitness();
    }
    
  }
  
  
  boolean allPlayersDead() {
    for(int i = 0; i < players.length; i++) {
      if(!players[i].dead && !players[i].reachedGoal) {
        return false;
      }
    }

    return true;
    
  }
  
  int numberDead() {
    int numberDead = 0;
    
    for(int i = 0; i < players.length; i++) {
      if(players[i].dead) {
        numberDead += 1;
      }
    }
    
    return numberDead;
  }
  
  
  void naturalSelection() {
    Player newPlayers[] = new Player[players.length];
    
    calculateFitnessSum();
    
    setBestPlayer();
    
    newPlayers[0] = players[bestPlayer].getBaby();
    newPlayers[0].isBest = true;
    
    for(int i = 0; i < newPlayers.length; i++) {
      
      Player parent = selectParent();
      
      newPlayers[i] = parent.getBaby();
      
    }
    
    players = newPlayers.clone();
    
    gen ++;
    stepsLeft = stepsPerGen;
    
    println(gen);
    
  }
  
  
  void calculateFitnessSum() {
    fitnessSum = 0;
    for(int i = 0; i < players.length; i++) {
      fitnessSum += players[i].fitness;      
    }
  }
  
  
  Player selectParent() {
    float rand = random(fitnessSum);
    
    float runningSum = 0;
    
    for(int i = 0; i < players.length; i++) {
      runningSum += players[i].fitness;
      if(runningSum > rand) {
        return players[i];
      }
    }
    
    // Should never get to this point
    println("Should never get to this point");
    return null;
  }
  
  
  void mutateBabies() {
    for(int i = 1; i < players.length; i++) {
      players[i].brain.mutate();
    }
  }
  
  
  void setBestPlayer() {
    float max = 0;
    int maxIndex = 2;
    
    for(int i = 1; i < players.length; i++) {
      if(players[i].fitness > max) {
        max = players[i].fitness;
        maxIndex = i;
      }
    }
    
    bestPlayer = maxIndex;
    
    if(players[bestPlayer].reachedGoal) {
      minStep = players[bestPlayer].brain.step;
    }
    
    
  }
  
  
  
  
}
