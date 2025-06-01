#!/bin/bash

read -p "Topic name (e.g. HashMap, Recursion): " topic
read -p "Platform (e.g. LeetCode, GFG, HackerRank): " platform
read -p "Enter problem names (space-separated): " -a problems

folder="${topic}_${platform}"
mkdir -p "$folder"

for problem in "${problems[@]}"; do
    file="${folder}/${problem}.java"

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

git add .
git commit -m "Added ${#problems[@]} problems on $topic from $platform"
git push origin main

echo "🚀 All files pushed to GitHub!"
