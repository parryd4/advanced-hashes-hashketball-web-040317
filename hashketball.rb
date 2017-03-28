require 'pry'
# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  we_care_about = 0
  game_hash.each do |team, team_data|
  #  puts "#{team} TopLevel"
    team_data.each do |feature, details|
  #    puts feature
      if feature == :players
  #      puts "success"
        details.each do |p_name, categories|
          if name == p_name
            categories.each do |stat, value|
              if stat == :points
                we_care_about = value
              end
            end
          end
        end
      end
    end
  end
  we_care_about
end

def shoe_size(name)
  we_care_about = 0
  game_hash.each do |team, team_data|
  #  puts "#{team} TopLevel"
    team_data.each do |feature, details|
  #    puts feature
      if feature == :players
  #      puts "success"
        details.each do |p_name, categories|
          if name == p_name
            categories.each do |stat, value|
              if stat == :shoe
                we_care_about = value
              end
            end
          end
        end
      end
    end
  end
  we_care_about
end


def team_colors(team)
  array = []
  game_hash.each do |hoa, team_data|
    #puts "#{hoa} hoa"
    #puts "#{team_data}"
    if team_data[:team_name] == team
      array = team_data[:colors]
    end
  end
  array
end


def team_names
  array = []
  game_hash.each do |team, team_data|
    team_data.each do |key, value|
      if key == :team_name
        array << value
      end
    end
  end
  array
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |hoa, team_data|
    if team_data[:team_name] == team
      team_data.each do |key, value|
        if key == :players
          value.each do |stat, recorded|
            recorded.each do |interesting, shirt_says|
              if interesting == :number
                jerseys << shirt_says
              end
            end
          end
        end
      end
    end
  end
  jerseys
end

def player_stats(player)
  we_care_about = 0
  game_hash.each do |team, team_data|
  #  puts "#{team} TopLevel"
    team_data.each do |feature, details|
  #    puts feature
      if feature == :players
  #      puts "success"
        details.each do |p_name, categories|
          if player == p_name
            we_care_about = categories
          end
        end
      end
    end
  end
  we_care_about  
end


def big_shoe_rebounds
  max_shoe = 0
  rebounds_interested = 0
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |key, value|
          value.each do |stat, number|
            if stat == :shoe && number >= max_shoe
              max_shoe = number
              rebounds_interested = value[:rebounds]
              
            end
          end
        end
      end
    end
  end
  rebounds_interested
end

big_shoe_rebounds
=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
good_practices
=end