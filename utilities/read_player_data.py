import sys
from nbt import nbt

def read_player_data(player_file):
    # Load the NBT file
    nbtfile = nbt.NBTFile(player_file, 'rb')
    
    # Print the NBT data in a readable format
    def print_tag(tag, indent=0):
        ind = ' ' * indent
        if isinstance(tag, nbt.TAG_List) or isinstance(tag, nbt.TAG_Compound):
            print(f"{ind}{tag.name} ({tag.__class__.__name__}):")
            for subtag in tag.tags:
                print_tag(subtag, indent + 2)
        else:
            print(f"{ind}{tag.name} ({tag.__class__.__name__}): {tag.value}")
    
    for tag in nbtfile.tags:
        print_tag(tag)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python read_player_data.py <player_data_file>")
        sys.exit(1)
    
    player_file = sys.argv[1]
    read_player_data(player_file)

