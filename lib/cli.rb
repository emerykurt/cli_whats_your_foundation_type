require '/Users/emerylumsden/Development/cli_whats_your_foundation_type/environment.rb'
require_relative './api.rb'
class CLI  
    #interacts with user 
        #ask the user what skin type do they have (options :dry, oily, combination)
        #ask the user what kind of finish they would like (options: dewy, satin, matte)
        #ask the user what kind of coverage (full, medium, light)
    #returns any puts or gets statement

    #controls the flow of our program

    
    def start 
        puts "Welcome"
        tab 
        API.fetch_makeup
        #take us to another method in your CLI
        self.menu
    end

    def menu
        puts "What is you favorite feature on your face?"
        sleep 1
        puts "Option 1: Eyes (That's your money maker!)"
        sleep 1
        puts "Option 2: Lips (Those lips were made for talking...)"
        sleep 1
        puts "Option 3: Skin (Just like BUTTAH!)"
        sleep 1
        puts "Option 4: I like them all!"
        puts " "
        user_input = gets.chomp.downcase 
        space 
        if user_input.include?("exit") || user_input.include?("end")
            goodbye
        elsif user_input.include?("I don't have one") || user_input.include?("none")
            encouragement
        elsif user_input.include?("eyes") || user_input == "1"
            self.eyes 
        elsif user_input.include?("lips") || user_input == "2"
            self.lips 
        elsif user_input.include?("skin") || user_input == "3"
            puts "You must share with me your skin care routine later!"
            space 
            self.skin 
        elsif user_input == "4" || user_input.include?("I like them all") || user_input.include?("all")
            self.face  
        else
           goodbye_smart
        end
    end
  

    def display_all_the_makeup
        #access all the makeup
        #print each one out
        MakeUp.all.each do |makeup|
            puts makeup.name
        end
    end

    def eyes
        puts "You have goregous eyes!"
        sleep 2
        puts "I think EYE have the perfect product for you!"
        sleep 2
        puts "Do you want to take a look?"
        sleep 2
        puts " "
        user_input1 = gets.chomp.downcase 
        if user_input1.include?("yes") || user_input1 == "y"
            puts "Great! I love this product!"
            ##puts product
        else
            goodbye
        end
    end

    def lips
        puts "It must be the shape because your lips are popping!"
        space 
        puts "Do we like a glossy fun lip or do we prefer a sophistcated lip."
        space 
        lip_choice == gets.chomp.downcase
            if lip_choice.include?("fun") || lip_choice.include?("glossy")
                puts "You have to try this!"
                ##puts the lip gloss
            elsif lip_choice.include?("sophisticated")
                puts "I think this would be your speed!"
                ##puts product
            elsif lip_choice.include?("both") || lip_choice.include?("combination")
                puts "I love this mentality! Here is the information for both!"
                ##puts both products
            else
                goodbye
            end
    end

    def skin
        puts " We offer two foundations. Let's figure out which one is best for you."
        space 
        sleep 2 
        puts "I have a two question for you." 
        space  
        sleep 2
        puts "Do you have dry, combo, or oily skin?" 
        puts "Do you like a dewy or matte finish?"
        space
        puts "(choose one from each question)"
        space 
        skin_info = gets.chomp.downcase
        space 
            if skin_info.include?("dry") && skin_info.include?("matte")
                puts "You want to load up on moisturizer first, but this would be your perfect product."
                ##puts product 
            elsif skin_info.include?("oily") && skin_info.include?("matte")
                puts "This one was designed for you!"
                ##puts product
            elsif skin_info.include?("dry") && skin_info.include?("dewy")
                puts "This one was designed for you!"
                ##puts product
            elsif skin_info.include?("oily") && skin_info.include?("dewy")
                puts "Hmm, I would put on a mattifying primer first, but this product would work!"
                ##puts product 
            elsif skin_info.include?("combo") && skin_info.include?("dewy")
                puts "Hmm, I would put on a mattifying primer first, but this product would work!"
                ##puts product
            elsif skin_info.include?("combo") && skin_info.include?("matte")
                puts "This one was designed for you!"
                ##puts product
            else
                puts "Hmm, did you make a mistake?"
                puts " "
                user_input_final = gets.chomp.downcase 
                space 
                    if user_input_final.include?("yes") || user_input_final == "y"
                        puts "That's okay! Please choose from the options given." 
                        sleep 2
                        puts "Let's go back to the questions!"
                        sleep 3
                        space 
                        skin 
                    else
                        puts "Hmm.."
                        sleep 2
                        puts "I have a free gift for you loading!"
                        sleep 7
                        puts "My free gift is waisting your time like you have waisted mine. Have a nice day!"
                    end
            end



    end

    def face
        puts "I love your confidence!"
        puts "Would you like to see all the products we have to offer?"
        puts " "
        user_input2 = gets.chomp.downcase 
        space 
        if user_input2.include?("yes") || user_input2 == "y"
            self.display_all_the_makeup
            space 
            sleep 1
            options
        elsif user_input2.include?("maybe")
            puts "Come on!! Knowledge is beauty. Knowledge is Power. Beauty = Power!!"
            user_input3 = gets.chomp.downcase 
            if user_input3.include?("yes") || user_input3 == "y"
                self.display_all_the_makeup 
            else  
                goodbye
            end
        else
            goodbye 
        end
    end

    def encouragement
        puts "Makeup up is not meant to recreate, but to enhance." 
            sleep 1
            puts "Take a second, look in the mirror or take a selfie, tell yourself you are beautiful."
            sleep 1
            puts "Repeat those steps until you see how beautiful we think you are!"
            sleep 1
            puts "See you soon!"
    end

    def tab
        puts " "
        sleep 1
        puts " "
    end

    def space 
        puts "  "
    end

    def options
        puts "We have two options for foundations and for lips!"
        sleep 2
        puts "Do you need help picking out a foundation or a lip product?"
        puts " "
        user_input_product = gets.chomp.downcase 
        puts " "
        if user_input_product.include?("foundation") && user_input_product.include?("lip") || user_input_product.include?("both") 
            puts "I am sorry. We can only look at one at a time."
            sleep 2
            puts "Let's go back and choose another option."
            sleep 2
            space 
            options 
        elsif user_input_product.include?("foundation") 
            self.skin
        elsif user_input_product.include?("lip")
            self.lips 
        elsif user_input_product.include?("no")
            puts "No problem. You are quite the makeup expert! I hope you enjoy your shopping!"
        else
            goodbye_smart
        end
    end 
    
    def goodbye
        puts "Would you like to go back to the main menu?"
        space
        user_resp = gets.chomp.downcase
        space
        if user_resp.includes("yes") || user_resp == "y" || user_resp.include?("I don't know") || user_resp.include?("idk") || user_resp.include?("not sure")
            puts "That's okay! Let's go back to the menu!"
            tab
            menu
        else
            puts "That's alright! You're still goregous. Maybe next time! Goodbye!"
        end
    end

    def goodbye_smart
        puts "Hmm, did you make a mistake?"
        puts " "
        user_input_final = gets.chomp.downcase 
        space
        if user_input_final.include?("yes") || user_input_final == "y"
            puts "That's okay! Please choose from the options given." 
            sleep 2
            puts "Let me redirect you back to the main menu."
            sleep 3
            tab 
            menu
        else
            puts "Hmm.."
            sleep 2
            puts "I have a free gift for you loading!"
            sleep 7
            puts "My free gift is waisting your time like you have waisted mine. Have a nice day!"
        end
    end
end

