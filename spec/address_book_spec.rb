 require_relative '../models/address_book'

 RSpec.describe AddressBook do
     
    #1
    let(:book) { AddressBook.new }
    
    #6
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
     
    #2     
   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
     end

     it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end

     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
      end
    end
    
    describe "#remove_entry" do
        it "removes an entry using the name, phone_number, and email address" do
            book.add_entry('Bobby Boucher', '614.123.5555', 'boosh@waterboy.com')
            
            name = "Ada Lovelace"
            phone_number = "010.012.1815"
            email = "augusta.king@lovelace.com"
            book.add_entry(name,phone_number,email)
            
            expect(book.entries.size).to eq(2)
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
            expect(book.entries.first.name).to eq("Bobby Boucher")
        end
        end


   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
       expect(book.entries.size).to eq(1)
     end
 
     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end
   
   describe "#import_from_csv" do
       it "imports the correct number of entries" do
           #3
           book.import_from_csv("entries.csv")
           book_size = book.entries.size
           
           expect(book_size).to eq 5
       end
   #4
   it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       #checking the first entry
       entry_one = book.entries[0]
       check_entry(entry_one, "Bill","555-555-4854","bill@blocmail.com")
   end
        it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two,"Bob","555-555-5415","bob@blocmail.com")
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three,"Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036","sussie@blocmail.com")
     end
 end
    describe "importing from entries_2.csv" do
       it "imports the correct number of entries" do
           book.import_from_csv("entries_2.csv")
           book_size = book.entries.size
           
           expect(book_size).to eq 3
       end
     it "imports the 6th entry" do
         book.import_from_csv("entries_2.csv")
         entry_six = book.entries[0]
         check_entry(entry_six,"Phil", "845-323-1326","pjwilson27@gmail.com")
   end
   it "imports the 7th entry" do
       book.import_from_csv("entries_2.csv")
       entry_seven = book.entries[2]
       check_entry(entry_seven,"Titan", "614-818-4053", "dog@woof.com")
   end
   it "imports the 8th entry" do
       book.import_from_csv("entries_2.csv")
       entry_eight = book.entries[1]
       check_entry(entry_eight,"Sadie", "614-289-3002", "bark@woof.com")
   end
   end
   
 end