#!/bin/bash

# Step 1: Get topic and platform
read -p "Topic name (e.g. HashMap, Recursion): " topic
read -p "Platform (e.g. LeetCode, GFG, HackerRank): " platform

# Format folder name
folder="${topic}_${platform}"
mkdir -p "$folder"

# Step 2: Get problem names (space-separated)
read -p "Enter problem names (space-separated, e.g. TwoSum MaxSubarray): " -a problems

# Step 3: Loop to create files
for problem in "${problems[@]}"; do
    file="${folder}/${problem}.java"

    # Add a Java template
    cat <<EOL > "$file"
// $problem.java
// Solved on $platform
// Topic: $topic

public class $problem {
    public static void main(String[] args) {
        // Your code here
    }
}
EOL

    echo "✅ Created: $file"
done

# Step 4: Git add, commit, and push
git add .
git commit -m "Added ${#problems[@]} problems on $topic from $platform"
git push origin main

echo "🚀 All files pushed to GitHub!"
