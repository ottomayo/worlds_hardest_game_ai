class Player {
  Brain brain;
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  
  float fitness = 0;
  
  Player() {
    pos = new PVector(90, 150);
    //pos = new PVector(300, 500);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    brain = new Brain(stepsPerGen);
    
  }
  
  void show() {
    fill(255,0,0);
    stroke(0);
    rect(pos.x, pos.y, 10, 10);
  }
  
  
  void update() {
    if(!dead && !reachedGoal) {
      
      if(level.touchingGoal(pos.x, pos.y)) {
        reachedGoal = true;
        
      }
      if(level.insideArea(pos.x, pos.y)) {
        move();
        
      } else { println("insideArea()"); }
      if(!level.insideArea(pos.x, pos.y) && !level.touchingGoal(pos.x, pos.y)) {
        dead = true;
      };
      
    }
    
  }
  
  void move() {
    if(brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step += 1;
    } else {
      dead = true;
    }
    
    vel.add(acc);
    vel.limit(3);
    
    pos.add(vel);
  }
  
  
  void calculateFitness() {
    if(reachedGoal) {
      fitness = 1.0 / 16.0  +  10000.0 / (float)(brain.step * brain.step);
      
    } else {
      float distanceToGoal = dist(pos.x, pos.y, level.endZone[0], level.endZone[1]);
      fitness = 1.0 / (distanceToGoal * distanceToGoal);
    }
    
  }
  
  
  Player getBaby() {
    Player baby = new Player();
    baby.brain = brain.clone();
    baby.brain.step = 0;
    
    return baby;
  }
  
  
  
  
}
