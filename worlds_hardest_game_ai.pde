Level level;
Population pop;
//Player test;

int stepsPerGen = 1000;

void setup() {
  size(600, 390);
  //fullScreen();
  
  level = new Level();
  pop = new Population(1000);
  //test = new Player();
  
}

// TODO: Fix Level class so that it can be properley tested 
//       whether a player is within the boundaries of
//       the normalArea array. (Fix Level.insideArea()
//       method).

// TODO: Add moving obstacles.


void draw() {
  background(100, 100, 255);
  strokeWeight(3);
  
  level.draw();
  
  if(pop.allPlayersDead()) {
    
    // Genetic algorithm
    
    pop.calculateFitness();
    pop.naturalSelection();
    pop.mutateBabies(); 
    
  } else {
    
    pop.update();
    pop.show();
    
  }
  

  //test.update();
  //test.show();
  
}
